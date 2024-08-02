# flutternotes

1. Run the GOLANG API first using the command
!!! Make sure you're in this project's folder
`cd API`
`go get .`
`go run .`

2. Then, run ipconfig on your windows pc
`ipconfig`

look for your local pc ip and make sure you're connected on the same network with your physical device if you're using physical device.

3. Change the URI on the home.dart file to your local ip address. 
Note1: it is located in ./ui/home.dart (It is marked by a big "TODO" just use ctrl+f to search it easily)
Note2: Don't forget to use "http://" in front of your URI

4. All set. Just run like usual using f5 or using this command
`cd ..`
`flutter run`

5. Profit.
