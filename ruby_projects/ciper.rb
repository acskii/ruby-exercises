# acskii :p

# Know range between a - z, A - Z
# Make sure that increased ordinal number is within it
# .. If not, get difference from larger boundary and start again from smaller one

def adjust_ord(ordinal, min_chr, max_chr)
    # Given ord value and cycles it back within given range
    if ordinal > max.ord
        (ordinal - max.ord) + min.ord - 1
    elsif ordinal < min.ord
        max.ord - (min.ord - ordinal) - 1
    else
        ordinal
    end
end

def caesar_cipher(string, key)
    # Caesar cipher
    ciphered = ''
    string.each_char do |letter|
        # Get character ordinal
        if /[a-zA-z]/.match letter
            ordinal = letter.ord + key

            # Determine character case
            if letter == letter.upcase
                # Upper case
                # Adjust ordinal
                ordinal = adjust_ord(ordinal, 'A', 'Z')
                
                # Shove it
                ciphered << ordinal.chr
                
            else 
                # Lower case
                # Adjust ordinal
                ordinal = adjust_ord(ordinal, 'a', 'z')
                
                # Shove it
                ciphered << ordinal.chr
            end
        else
            ciphered << letter
        end
    end
    ciphered
end