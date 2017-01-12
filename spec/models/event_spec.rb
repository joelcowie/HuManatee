require_relative '../rails_helper'

describe Event do
  let(:event) { Event.create(title: "clean up da streetz", description: "Clean streetz tho?", creator_id: 1, level: "local", category: "Environment", start_date: "03-01-2017 12:15", end_date: "03-01-2017 15:00")} #Past

  context 'instance methods' do

    it 'should respond to a past_event? method' do
      expect(event.past_event?).to be(true)
    end
  end
end
