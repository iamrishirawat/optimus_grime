require 'spec_helper'

describe 'OptimusGrime' do
  let(:subject) { OptimusGrime.new(5, 5) }

  describe '#move' do
    context 'when coordinates are invalid' do
      it 'should print error' do
        expect { subject.move(-1, 5) }.to output("Coordinates (-1, 5) are falling outside the defined area.\n").to_stdout
      end
  
      it 'should print error' do
        expect { subject.move(5, 6) }.to output("Coordinates (5, 6) are falling outside the defined area.\n").to_stdout
      end
    end
  
    context 'when coordinates are valid' do
      it 'should clean the area' do
        expect { subject.move(1, 3) }.to output("ENNNC").to_stdout
        expect { subject.move(4, 4) }.to output("EEENC").to_stdout
      end

      context 'when passing same coordinates consecutively' do
        it 'should clean the area twice' do
          expect { subject.move(1, 3) }.to output("ENNNC").to_stdout
          expect { subject.move(1, 3) }.to output("C").to_stdout
        end
      end

      context 'when passing same coordinates alternately' do
        it 'should clean the area twice for first and third coordinates' do
          expect { subject.move(1, 3) }.to output("ENNNC").to_stdout
          expect { subject.move(4, 4) }.to output("EEENC").to_stdout
          expect { subject.move(1, 3) }.to output("WWWSC").to_stdout
        end
      end
    end
  end
end
