

BASE64_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';


b64encode = (octets) ->
  strings = []
  numOctets = octets.length
  i = 0
  while i < numOctets
    combined = (
        ((octets[i] or 0) << 16) | 
        ((octets[i + 1] or 0) << 8) | 
        ((octets[i + 2] or 0)))
    i += 3
    strings.push(
        BASE64_ALPHABET.charAt((combined >> 18) & 0x3F) +
        BASE64_ALPHABET.charAt((combined >> 12) & 0x3F) +
        BASE64_ALPHABET.charAt((combined >> 6) & 0x3F) +
        BASE64_ALPHABET.charAt(combined & 0x3F))
  # 0 ''            
  # 1 'AA=='        
  # 2 'AAA='        
  # 3 'AAAA'        
  # 4 'AAAAAA=='    
  # 5 'AAAAAAA='    
  # 6 'AAAAAAAA'    
  paddingLength = [0, 2, 1][numOctets % 3]
  s = strings.join ''
  (
    s.substr(0, s.length - paddingLength) + 
    (['', '=', '=='][paddingLength]))


# Assumes padding
b64decode = (s) ->
  octets = []
  numChars = (s.length - ((s.match(/[=]+/) or [''])[0].length))
  i = 0
  while i < numChars
    combined = (
                  ((BASE64_ALPHABET.indexOf(s[i]) % 64) << 18) |
                  ((BASE64_ALPHABET.indexOf(s[i + 1]) % 64) << 12) |
                  ((BASE64_ALPHABET.indexOf(s[i + 2]) % 64) << 6) |
                  (BASE64_ALPHABET.indexOf(s[i + 3]) % 64))
    i += 4
    octets.push ((combined >> 16) & 0xFF)
    if (i - 1) <= numChars
      octets.push ((combined >> 8) & 0xFF)
      if (i - 1) < numChars
        octets.push ((combined) & 0xFF)
  octets


module.exports =
  BASE64_ALPHABET: BASE64_ALPHABET
  b64encode: b64encode
  b64decode: b64decode

