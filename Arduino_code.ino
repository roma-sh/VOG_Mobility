
// Pin definitions
int motor1_pin1 = 3;  // IN1
int motor1_pin2 = 4;  // IN2
int motor2_pin1 = 5;  // IN3
int motor2_pin2 = 6;  // IN4
int enable1 = 9;  // Enable 1
int enable2 = 10; // Enable 2

void setup() {
	// Initialize motor pins as outputs
	pinMode(motor1_pin1, OUTPUT);
	pinMode(motor1_pin2, OUTPUT);
	pinMode(motor2_pin1, OUTPUT);
	pinMode(motor2_pin2, OUTPUT);

	// Initialize Enable pins as outputs
	pinMode(enable1, OUTPUT);
	pinMode(enable2, OUTPUT);

  // Start Serial communication at 9600 baud rate
  Serial.begin(9600);
}

void loop() {
	if (Serial.available()) {
		String command = Serial.readString();  // Read the incoming serial data

		// Process the received command
		if (command == "right") {
			// Move motor forward (right)
			digitalWrite(motor1_pin1, HIGH);
			digitalWrite(motor1_pin2, LOW);
			digitalWrite(motor2_pin1, HIGH);
			digitalWrite(motor2_pin2, LOW);
			analogWrite(enable1, 255);  // Set motor speed (PWM)
			analogWrite(enable2, 255);  // Set motor speed (PWM)
		}
		else if (command == "left") {
			// Move motor backward (left)
			digitalWrite(motor1_pin1, LOW);
			digitalWrite(motor1_pin2, HIGH);
			digitalWrite(motor2_pin1, LOW);
			digitalWrite(motor2_pin2, HIGH);
			analogWrite(enable1, 255);  // Set motor speed (PWM)
			analogWrite(enable2, 255);  // Set motor speed (PWM)
		}
		else if (command == "stay") {
			// Stop motors (stay in place)
			digitalWrite(motor1_pin1, LOW);
			digitalWrite(motor1_pin2, LOW);
			digitalWrite(motor2_pin1, LOW);
			digitalWrite(motor2_pin2, LOW);
		}
  }
}
