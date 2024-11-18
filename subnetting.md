Efficient Subnetting:
Let's consider a CIDR block 192.168.0.0/16.
Now, I wish to create 5 networks out of the above.
10k IPs
7k IPs
1k IPs
20k IPs
20 IPs
Would you go sequentially (based on the above list) or in a descending order (no. of IPs)?

---

What if we do it sequentially?
Let's choose the network that required 7k IPs.
Possible subnet: 192.168.0.0/19 (gives 8,192 IPs)
Range: 192.168.0.0 - 192.168.31.255
And now, the one requiring 10k IPs
Remember the last IP with the previous network.
If you now continue from 192.168.32.0, you will begin all the way from the first IP of the previous network. Try it out with a cidr calculator.
Possible subnet: 192.168.0.0/18 (gives 16,348 IPs)
Range: 192.168.0.0 - 192.168.63.255
This will lead to tons of problems. /18 network is already contained within /19. Changes to /19 in terms of ACLs and other configs will also be reflected to /18. It's like there's another house inside a house.
If you being a knowledgeable administrator, you would skip the entire range, and start from an IP that is not within the above one. But, that's not it. If you have another network requiring more IPs than that of the above, then that will get the above smaller networks than itself under it. Not just waste of IPs, but endless complications.
Let's say 30k IPs
Possible subnet: 192.168.0.0/17 (gives 32,766 IPs)
Range: 192.168.0.0 - 192.168.127.255
which will contain the above smaller networks
Range: 192.168.0.0 - 192.168.31.255
Range: 192.168.0.0 - 192.168.63.255

---

Let's try the right way i.e. descending order based on the number of IPs required - 4. for 20k IPs
Possible subnet: 192.168.0.0/17 (gives 32,768 IPs)
Range: 192.168.0.0 - 192.168.127.255
10k IPs
Look at the last IP with the previous network
Possible subnet: 192.168.128.0/18 (gives 16,384 IPs)
Range: 192.168.128.0 - 192.168.191.255 2. 7k IPs
Look at the last IP with the previous network
Possible subnet: 192.168.192.0/19 (gives 8,192 IPs)
Range: 192.168.192.0 - 192.168.223.255 3. 1k IPs
Look at the last IP with the previous network
Possible subnet: 192.168.224.0/22 (gives 1,024 IPs)
Range: 192.168.224.0 - 192.168.227.255 5. 20 IPs
Look at the last IP with the previous network
Possible subnet: 192.168.228.0/27 (gives 32 IPs)
Range: 192.168.228.0 - 192.168.228.31
