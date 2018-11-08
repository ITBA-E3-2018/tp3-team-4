int I = 6;
int S = 7;

void setup() {
  // put your setup code here, to run once:
  pinMode(I, OUTPUT);
  pinMode(S, OUTPUT);
}

void loop() {
  delay(10);
  digitalWrite(S, LOW);
  digitalWrite(I, LOW);
  digitalWrite(I, HIGH);
  digitalWrite(S, LOW);
  delay(10);
  digitalWrite(I, HIGH);
  digitalWrite(S, HIGH);
  delay(1000);
  digitalWrite(I, HIGH);
  digitalWrite(S, LOW);
  delay(10);
  digitalWrite(I, HIGH);
  digitalWrite(S, HIGH);
  // put your main code here, to run repeatedly:

}
