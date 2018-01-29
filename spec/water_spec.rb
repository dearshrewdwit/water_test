require 'spec_helper'

RSpec.describe Water do
  context 'Invalid input data' do
    xit 'raises a TypeError for input that is not Array' do
      expect { described_class.new.find_water(123) }.to raise_error TypeError
    end
  end

  context 'Valid input data' do
    subject { described_class.new.find_water(data_set) }

    context 'Set no 1' do
      let(:data_set) { [2, 0, 2] }

      it { is_expected.to eq 2 }
    end

    context 'Set no 2' do
      let(:data_set) { [3, 0, 0, 2, 0, 4] }

      it { is_expected.to eq 10 }
    end

    context 'Set no 3' do
      let(:data_set) { [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1] }

      it { is_expected.to eq 6 }
    end

    context 'Set no 4' do
      let(:data_set) { [1, 5, 3, 7, 2] }

      it { is_expected.to eq 2 }
    end

    context 'Set no 5' do
      let(:data_set) { [5, 3, 7, 2, 6, 4, 5, 9, 1, 2] }

      it { is_expected.to eq 14 }
    end

    context 'Set no 6' do
      let(:data_set) { [5, 3, 7, 2, 6, 4, 5, 9, 1, 1, 2] }

      it { is_expected.to eq 15 }
    end
  end
end
