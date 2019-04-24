# trucks-weather-lighting
This repository is used to host traffic data and some simple code examples used to analyze the data. 

The data are aggregated from several public sources. 

The code can be run in R but uses some libraries that you may have to install first.

The code is found in the MARScodeForTrucks.r file. It is fairly heavily commented, so it should be clear what is going on, and it should not be too difficult to adapt the code to other data that you may have already.

The data files contain data in text format, with one line per data item and TABs separating the columns. (This is also the format that the code above expects.) The first line has column headings, so you can probably guess what the different columns represent. A quick description follows below. The file JonasV15AllTrucksRawData contains all data (both light and heavy trucks), the JonasV15HeavyTrucksRawData only uses data on heavy trucks, and the file JonasV15LightTrucksRawData uses only data on light trucks.

The data columns are:

- TFP, the ID number of the traffic measuring station the data come from.
- Direction, has a value of either 1 or 2, to separate traffic going in opposite directions.
- Year, the year the data were collected (in the Gregorian calendar)
- Month, the month the data were collected (1=January, 12=December)
- Day, the day in the month the data were collected.
- Hour, the hour of the day tha data were collected.
- Minute, the minute of the hour the data were collected.
- LightingOrNot, indicates if there is road lighting at this traffic measuring point.
- AgeOfLighting, indicates how old the lighting is, if lighting is present.
- QualityOfLigting, indicates how good the lighting is, if present.
- DistanceToIntersection, the distance in meters to the nearest intersection.
- RoadWidth, the width of the road.
- SpeedLimit, posted speed limit (the acutal limit for trucks may be different from the posted speed limit).
- RoadSurfaceTemp, the road surface temperature at the time.
- AirTemp, the air temperature at the time.
- Humidity, the humidity at the time.
- DewPointTemp, the dew point temperature.
- RainOrSnow, indicates if it was raining, snowing, or clear weather.
- Precipitation, the amount of precipitation.
- DayOrNight, indicates if it was day or night (the traffic measuring points are in Sweden, and during some days there are 24 hours of sunlight or 24 hour darkness).
- FKL, vehicle class.
- FANT, number of vehicles.
- AvSpeed, the average speed during the measruing interval.
- RelativeSpeed, average speed divided by posted speed limit.
- SpeedDiff, average speeed - posted speed limit.
- RelativeSpeedDiff, SpeedDiff divided by posted speed limit.

The weather data comes from a different location than the traffic data, but in general a weather station fairly close (the closest functioning one) to the traffic measuring station is used so the data are assumed to be more or less correct. Similarly, for judging if it is daylight/twilight/night the setting/rising of the sun in a nearby location is used but the data are not from the actual traffic measuring stations. For details, see for example the paper "Effects of weather conditions, light conditions, and road lighting on vehicle speed" by Annika Jägerbrand and Jonas Sjöbergh.
