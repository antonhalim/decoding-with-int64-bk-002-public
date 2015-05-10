require 'pry'
def encode_int64(message)
  return "The word should only contain letters in acdegilmnoprstuw" if !/[bfhjkqvxyz]/.match(message).nil?
  string = "acdegilmnoprstuw"
  result = 7
  message.split("").each do |char|
    result = (result*37) + string.index(char)
  end
  result
end

def decode_int64(encoded_message)
  string = "acdegilmnoprstuw"
  result = ""
  until encoded_message - 7 == 0 do
    index = encoded_message % 37
    result  << string[index]
    encoded_message = encoded_message/37
  end
  return result.reverse
end
