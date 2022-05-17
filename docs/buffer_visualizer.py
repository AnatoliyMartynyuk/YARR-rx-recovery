<<<<<<< Updated upstream
buffer = "H" + 64*'A' + "HH" + 64*'B' + "HH" + 64*'C' + "HH" + 64*'D' + "HH" + 64*'E' + "HH" + 64*'F'

for x in range(0,10):
    buffer = buffer + "HH" + 64*'A' + "HH" + 64*'B' + "HH" + 64*'C' + "HH" + 64*'D' + "HH" + 64*'E' + "HH" + 64*'F'

buffer193_mask = '1'*67 + '0'*126

offset = 0

=======
#buffer = "H" + 64*'A' + "HH" + 64*'B' + "HH" + 64*'C' + "HH" + 64*'D' + "HH" + 64*'E' + "HH" + 64*'F'
buffer = "H" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-'
for x in range(0,10):
    #buffer = buffer + "HH" + 64*'A' + "HH" + 64*'B' + "HH" + 64*'C' + "HH" + 64*'D' + "HH" + 64*'E' + "HH" + 64*'F'
    buffer = buffer + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-' + "HH" + 64*'-'

#buffer193_mask = '1'*67 + '0'*126
buffer193_mask = '0' + '1'*66 + '0'*127

offset = 0

#print("---------------------------------------\n header search is 67 bits wide \n---------------------------------------")
print("---------------------------------------\n header search is 66 bits wide \n---------------------------------------")

>>>>>>> Stashed changes
for x in range(0,32):
    print(buffer[(offset + 0):(offset + 193)])
    print(buffer193_mask)
    print('')

    buffer193_mask = "00" + buffer193_mask[0:-2]

    if (x != 5):
        offset = offset + 64
    else:
<<<<<<< Updated upstream
=======
        print("bit add occured")
>>>>>>> Stashed changes
        offset = offset + 64 - 1

