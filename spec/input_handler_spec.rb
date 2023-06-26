require 'spec_helper'

describe 'InputHandler' do
  context '#valid?' do
    context 'when area and coordinates are valid' do
      let(:subject) { InputHandler.new('5x5', ['1,3', '4,4']) }
  
      it 'should return true' do
        expect(subject.valid?).to be_truthy
      end

      context 'when one of coordinates is valid' do
        let(:subject) { InputHandler.new('5x5', ['1', '4,4']) }
    
        it 'should return true' do
          expect(subject.valid?).to be_truthy
        end
      end
    end

    context 'when area and coordinates are nil' do
      let(:subject) { InputHandler.new(nil, nil) }
  
      it 'should return false' do
        expect(subject.valid?).to be_falsy
      end
    end

    context 'when area is invalid' do
      let(:subject) { InputHandler.new('5x', ['1,3', '4,4']) }
  
      it 'should return false' do
        expect(subject.valid?).to be_falsy
      end
    end

    context 'when coordinates are invalid' do
      let(:subject) { InputHandler.new('5x5', ['1']) }
  
      it 'should return false' do
        expect(subject.valid?).to be_falsy
      end
    end
  end
end
