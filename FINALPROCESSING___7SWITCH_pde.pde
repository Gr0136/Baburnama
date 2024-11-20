import processing.serial.*;
import processing.video.*;

Serial arduino; // Create a serial port object
Movie video1;  // Create the first movie object
Movie video2;  // Create the second movie object
Movie video3;  // Create the third movie object
Movie video4;  // Create the fourth movie object
Movie video5;  // Create the fifth movie object
Movie video6;  // Create the sixth movie object

boolean button1Pressed = false; // Track if button 1 is pressed
boolean button2Pressed = false; // Track if button 2 is pressed
boolean button3Pressed = false; // Track if button 3 is pressed
boolean button4Pressed = false; // Track if button 4 is pressed
boolean button5Pressed = false; // Track if button 5 is pressed
boolean button6Pressed = false; // Track if button 6 is pressed

Movie activeVideo = null; // Track the active video

void setup() {
  size(1920,1080); // Set screen size
  frameRate(24); // Set the frame rate
  arduino = new Serial(this, Serial.list()[0], 9600); // Initialize serial communication with Arduino
  
    // Load your video files (replace with your video file paths)
  video1 = new Movie(this, "C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Ferghana.mp4");
  video2 = new Movie(this, "C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Samarkand.mp4");
  video3 = new Movie(this, "C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Kabul_1.mp4");
  video4 = new Movie(this, "C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Khanwa.mp4");
  video5 = new Movie(this, "C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Panipat.mp4");
  video6 = new Movie(this,"C:\\Users\\Legion\\OneDrive\\Desktop\\college\\SEMESTER -5\\PHYSICAL COMPUTING\\code\\Final video with audio\\with audio\\With Audio\\Agra.mp4");
     // Mute the audio for all videos
  video1.volume(0.0);
  video2.volume(0.0);
  video3.volume(0.0);
  video4.volume(0.0);
  video5.volume(0.0);
  video6.volume(0.0);
 }

void draw() {
  // Check for data from Arduino
  while (arduino.available() > 0) {
    String message = arduino.readStringUntil('\n'); // Read the message from Arduino

    if (message != null) {
      message = message.trim();
      println("Received from Arduino: " + message); // Print the received message
      
      // Set the flag and active video based on the button pressed
      if (message.equals("Button1Pressed")) {
         button1Pressed = true;
        button2Pressed = false;
        button3Pressed = false;
        button4Pressed = false;
        button5Pressed = false;
        button6Pressed = false;
        activeVideo = video1;
         } else if (message.equals("Button2Pressed")) {
        button1Pressed = false;
        button2Pressed = true;
        button3Pressed = false;
        button4Pressed = false;
        button5Pressed = false;
        button6Pressed = false;
        activeVideo = video2;
        } else if (message.equals("Button3Pressed")) {
        button1Pressed = false;
        button2Pressed = false;
        button3Pressed = true;
        button4Pressed = false;
        button5Pressed = false;
        button6Pressed = false;
        activeVideo = video3;
        } else if (message.equals("Button4Pressed")) {
        button1Pressed = false;
        button2Pressed = false;
        button3Pressed = false;
        button4Pressed = true;
        button5Pressed = true;
        button6Pressed = true;
        activeVideo = video4;
          } else if (message.equals("Button5Pressed")) {
        button1Pressed = false;
        button2Pressed = false;
        button3Pressed = false;
        button4Pressed = true;
        button5Pressed = true;
        button6Pressed = true;
        activeVideo = video5;
          } else if (message.equals("Button6Pressed")) {
        button1Pressed = false;
        button2Pressed = false;
        button3Pressed = false;
        button4Pressed = true;
        button5Pressed = true;
        button6Pressed = true;
        activeVideo = video6;
               
      }
    }
  }
  
   // Handle video playback
  if (button1Pressed || button2Pressed || button3Pressed || button4Pressed || button5Pressed || button6Pressed ) {
    playVideo(activeVideo);
  }
}

void resetVideo(Movie vid) {
  vid.jump(0); // Restart the video from the beginning
}

void playVideo(Movie vid) {
  // Display the video when a button is pressed
  image(vid, 0, 0, width, height);
  vid.play(); // Start the video
  vid.volume(1.0); // Unmute the audio of the active video
  
  // Pause the other videos (if they're playing) and mute their audio
  if (vid == video1) {
    resetVideo(video2);
    resetVideo(video3);
    resetVideo(video4);
     resetVideo(video5);
      resetVideo(video6);
             
    video2.pause();
    video2.volume(0.0);
    video3.pause();
    video3.volume(0.0);
    video4.pause();
    video4.volume(0.0);
    video5.pause();
    video5.volume(0.0);
    video6.pause();
    video6.volume(0.0);
   
  } else if (vid == video2) {
    resetVideo(video1);
    resetVideo(video3);
    resetVideo(video4);
     resetVideo(video5);
      resetVideo(video6);
      
    video1.pause();
    video1.volume(0.0);
    video3.pause();
    video3.volume(0.0);
    video4.pause();
    video4.volume(0.0);
    video5.pause();
    video5.volume(0.0);
    video6.pause();
    video6.volume(0.0);
     
   } else if (vid == video3) {
    resetVideo(video1);
    resetVideo(video2);
    resetVideo(video4);
    resetVideo(video5);
      resetVideo(video6);
     
    video1.pause();
    video1.volume(0.0);
    video2.pause();
    video2.volume(0.0);
    video4.pause();
    video4.volume(0.0);
     video5.pause();
    video5.volume(0.0);
    video6.pause();
    video6.volume(0.0);
  
  } else if (vid == video4) {
    resetVideo(video1);
    resetVideo(video2);
    resetVideo(video3);
    resetVideo(video5);
      resetVideo(video6);
     
    video1.pause();
    video1.volume(0.0);
    video2.pause();
    video2.volume(0.0);
    video3.pause();
    video3.volume(0.0);
     video5.pause();
    video5.volume(0.0);
    video6.pause();
    video6.volume(0.0);
  
     } else if (vid == video5) {
    resetVideo(video1);
    resetVideo(video2);
    resetVideo(video3);
     resetVideo(video4);
      resetVideo(video6);
         
    video1.pause();
    video1.volume(0.0);
    video2.pause();
    video2.volume(0.0);
    video3.pause();
    video3.volume(0.0);
     video4.pause();
    video4.volume(0.0);
    video6.pause();
    video6.volume(0.0);
    
     } else if (vid == video6) {
    resetVideo(video1);
    resetVideo(video2);
    resetVideo(video3);
     resetVideo(video4);
      resetVideo(video5);
            
    video1.pause();
    video1.volume(0.0);
    video2.pause();
    video2.volume(0.0);
    video3.pause();
    video3.volume(0.0);
     video4.pause();
    video4.volume(0.0);
    video5.pause();
    video5.volume(0.0);
  
       }
}

  void movieEvent(Movie m) {
  m.read(); 
  
   // Check if the video has finished playing
  if (m.time() >= m.duration()) {
    m.stop(); // Stop the video
    m.jump(0); // Restart the video
    button1Pressed = false;
    button2Pressed = false;
    button3Pressed = false;
    button4Pressed = false;
    button5Pressed = false;
    button6Pressed = false;
 
  }
}
