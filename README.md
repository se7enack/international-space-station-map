Overview:
Creates a map in jpg format of exectly where the ISS is currently flying over.


Instructions

1. Sign up for a free API key:
https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register

2. Add your API key:
Edit iss.sh and add the API key from step 1


3. Build:
docker build -t se7enack/iss:v1 .


4. Run:
docker run  -v $HOME/Desktop:/tmp se7enack/iss:v1


Considerations:
This was written on a Mac. It will save the image (by default to the desktop). If you would like to change the path please edit '$HOME/Desktop' from step 4.


Screenshot:
![Alt text](https://github.com/se7enack/international-space-station-map/blob/master/ScreenShot!.jpg?raw=true "International Space Station Map")
