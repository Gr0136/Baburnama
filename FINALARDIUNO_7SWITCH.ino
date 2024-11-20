

void loop() {
  if (digitalRead(buttonPin1) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button1Pressed");
    delay(10);
  }
  else if (digitalRead(buttonPin2) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button2Pressed");
    delay(10);
  }
  else if (digitalRead(buttonPin3) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button3Pressed");
    delay(10);
  }
  else if (digitalRead(buttonPin4) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button4Pressed");
    delay(10);
  }
  else if (digitalRead(buttonPin5) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button5Pressed");
    delay(10);
  }
  else if (digitalRead(buttonPin6) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button6Pressed");
    delay(10);
  }else if (digitalRead(buttonPin7) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.println("Button7Pressed");
    delay(10);
  }

  else {
    digitalWrite(ledPin, LOW);
  }
}
