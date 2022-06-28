require 'caesar'

describe '#caesar_cipher' do
  it 'should shift each character by the given number in the alphabet' do
    expect(caesar_cipher('what a string', 5)).to eql('bmfy f xywnsl')
  end

  it 'should shift correctly with numbers greater than 26' do
    expect(caesar_cipher('hello', 50)).to eql('fcjjm')
  end

  it 'should not shift any non-alphabetical characters' do
    expect(caesar_cipher('!@#123', 5)).to eql('!@#123')
  end

  it 'should shift capitalized letters' do
    expect(caesar_cipher('Hello World', 10)).to eql('Rovvy Gybvn')
  end

  it 'should shift negative numbers' do
    expect(caesar_cipher('Hello World!', -52)).to eql('Hello World!')
  end
end
