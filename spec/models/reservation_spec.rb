require 'spec_helper'

describe Reservation do
  context 'valid reservation' do

    it 'has a valid factory' do
      expect(build(:reservation)).to be_valid
    end

    it 'has a not valid time in finish < start' do
      build(:reservation, finish: '2014-01-01 09:00:00').should_not be_valid
    end

    it 'has a not valid time in finish == start' do
      build(:reservation, finish: '2014-01-01 10:00:00').should_not be_valid
    end

    context 'within the range of validity' do
      let!(:resource) { create(:reservation) }

      it 'range completely overlaps' do
        build(:reservation, start: '2014-01-01 08:00:00',
               finish: '2014-01-01 22:00:00').should_not be_valid
      end

      it 'intersects only the start' do
        build(:reservation, start: '2014-01-01 08:00:00',
              finish: '2014-01-01 14:00:00').should_not be_valid
      end

      it 'intersects only the finish' do
        build(:reservation, start: '2014-01-01 14:00:00',
              finish: '2014-01-01 22:00:00').should_not be_valid
      end

      it 'be within' do
        build(:reservation, start: '2014-01-01 14:00:00',
              finish: '2014-01-01 16:00:00').should_not be_valid
      end

    end

  end

end
