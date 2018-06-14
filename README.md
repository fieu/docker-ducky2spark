

<h1 align="center">
  <br>
  <a href="https://github.com/NurdTurd/docker-ducky2spark"><img src="https://i.imgur.com/SdObGuR.png" alt="sad monkey baby" width="200"></a>
  <br>
  <code>docker-ducky2spark</code>
  <br>
  <br>
</h1>

<h4 align="center">Convert ducky script to uploadable Arduino sketch code for the Digispark development board.</h4>

## Initial Proposal
I wanted an easy way to convert ducky script to uploadable Arduino code for the Digispark development board.

Unfortunately, in order to do this you must use 2 projects/softwares:
The [`duck2spark`](https://github.com/mame82/duck2spark) project and [`Encoder.jar`](https://github.com/hak5darren/USB-Rubber-Ducky/blob/master/Encoder/encoder.jar) from the official Hak5 `hak5darren/USB-Rubber-Ducky` repo.
Also you must do everything manually, and it sucks when moving systems because you have to make sure all dependencies such as Python and Java are correctly installed.

## Solution <small>(sorta)</small>
Use Docker of course! That way we can develop our script on our local machine, run a small docker command, and everything is done for us within a container and we get only the output we need.

## Disclaimer
I'm new to Docker, the Dockerfile may look bad. If so, please make an issue explaining why. I want to get better at Docker, not worse.

## Requirements
* Docker
* Common sense

## Install <small>automated</small>
1. Run this one-liner: `$ docker build -t suce/ducky2spark github.com/NurdTurd/docker-ducky2spark`

## Install <small>(manual)</small>
1. Clone this repo to your local machine.
2. &nbsp;&nbsp;&nbsp;&nbsp;**Linux:** `$ git clone https://github.com/NurdTurd/docker-duck2spark.git`
3. &nbsp;&nbsp;&nbsp;&nbsp;**Windows:** Google it.
4. Next, within a terminal, enter the directory.
5. Run `$ docker build -t suce/ducky2spark .`

Now that we've "installed" it, let's look at the usage.
## Usage
Once you have edited `script.txt` (the file where your ducky script goes) to your liking, let's run the image so it can generate the Arduino code.
### Legend:
* `KB_TYPE` = keyboard layout. Possible options are: `be`, `br`, `ca`, `ch`, `cs`, `de`, `dk`, `es`, `fi`, `fr`, `gb`, `hr`, `it`, `no`, `pt`, `ru`, `si`, `sv`, `tr`, `us`

**Linux/macOS:**
```
$ docker run --rm -it -v $(pwd):/app -e KB_TYPE=us suce/ducky2spark
```
**Windows:**
```
$ docker run --rm -it -v %CD%:/app -e KB_TYPE=us suce/ducky2spark
```

Once finished, in the current folder, you will be presented with a `sketch.ino` file that you can then load into Arduino and upload to your Digispark.

## Credit
* [`mame82/duck2spark`](https://github.com/mame82/duck2spark)
* [`Encoder.jar`](https://github.com/hak5darren/USB-Rubber-Ducky/blob/master/Encoder/encoder.jar) from the official Hak5 `hak5darren/USB-Rubber-Ducky` repo.
