module Fastlane
  module Actions
    class TriggerBitriseBuildAction < Action
      def self.run(params)
        UI.message("The trigger_bitrise_build plugin is working!")

        app_slug = params[:app_slug] ||= ENV['BITRISE_APP_SLUG']
        api_token = params[:api_token] ||= ENV['BITRISE_API_TOKEN']
        app_title = params[:app_title] ||= ENV['BITRISE_APP_TITLE']
        git_branch = params[:git_branch] ||= ENV['BITRISE_GIT_BRANCH']
        git_commit = params[:git_commit] ||= ENV['BITRISE_GIT_COMMIT']
        git_tag = params[:git_tag] ||= ENV['BITRISE_GIT_TAG']
        workflow_id = params[:workflow_id] ||= ENV['BITRISE_TRIGGERED_WORKFLOW_ID']
        commit_message = params[:commit_message] ||= ENV['BITRISE_GIT_MESSAGE']
        parameters = []
        params[:parameters].each do |key, value|
          parameters << {
              mapped_to: key,
              value: value,
              is_expand: false
          }
        end
        triggered_by = params[:triggered_by] ||= 'Fastlane Auto Triggerer'

        bitrise_data = {
          hook_info: {
            type: "bitrise",
            api_token: api_token
          },
          build_params: {
            commit_hash: git_commit,
            branch: git_branch,
            workflow_id: workflow_id,
            tag: git_tag,
            commit_message: commit_message,
            environments: parameters
          },
          triggered_by: triggered_by
      }

        bitrise_result = JSON.parse(sh("curl 'https://www.bitrise.io/app/#{app_slug}/build/start.json' --silent --data '#{bitrise_data.to_json}'"))

        if (bitrise_result['status']).to_s != 'ok'
          UI.build_failure!("Failed to trigger auto retrying of #{app_title} 😞")
          abort("Failed to trigger auto rebuild")
        end

        UI.success("New build (#{bitrise_result['build_number']}) started at: #{bitrise_result['build_url']}")
      end

      def self.description
        "Trigger a Bitrise build from Fastlane"
      end

      def self.authors
        ["Nick Hammond"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                  env_name: "BITRISE_API_TOKEN",
                               description: "The Build Trigger API token.  Navigate to the app's code page to find it",
                                  optional: false,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :app_slug,
                                  env_name: "BITRISE_APP_SLUG",
                               description: "The app unique identifier.  Navigate to the app's code page to find it",
                                  optional: false,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :app_title,
                                  env_name: "BITRISE_APP_TITLE",
                               description: "The app name.  Navigate to the app's settings page to find it",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :git_branch,
                                  env_name: "BITRISE_GIT_BRANCH",
                               description: "The branch of the repo to build",
                                  optional: false,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :git_commit,
                                  env_name: "BITRISE_GIT_COMMIT",
                               description: "The commit hash of the repo to build",
                                  optional: false,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :git_tag,
                                  env_name: "BITRISE_GIT_TAG",
                               description: "The tag of the repo to build",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :workflow_id,
                                  env_name: "BITRISE_TRIGGERED_WORKFLOW_ID",
                               description: "The Bitrise workflow to use",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :commit_message,
                                  env_name: "BITRISE_GIT_MESSAGE",
                               description: "The message to pass to the build",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :parameters,
                               description: "Additional parameters to pass to the build",
                                  optional: true,
                                      type: Hash),

          FastlaneCore::ConfigItem.new(key: :triggered_by,
                               description: "Name that should appear of who triggered the build",
                                  optional: true,
                                      type: String,
                             default_value: "Fastlane Auto Triggerer")
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
