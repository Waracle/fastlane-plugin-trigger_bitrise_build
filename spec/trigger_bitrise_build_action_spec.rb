describe Fastlane::Actions::TriggerBitriseBuildAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The trigger_bitrise_build plugin is working!")

      Fastlane::Actions::TriggerBitriseBuildAction.run(nil)
    end
  end
end
