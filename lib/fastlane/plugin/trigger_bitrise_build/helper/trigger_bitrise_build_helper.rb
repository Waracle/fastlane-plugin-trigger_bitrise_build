module Fastlane
  module Helper
    class TriggerBitriseBuildHelper
      # class methods that you define here become available in your action
      # as `Helper::TriggerBitriseBuildHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the trigger_bitrise_build plugin helper!")
      end
    end
  end
end
