int I = 6;
int S = 7;

void setup() {
  // put your setup code here, to run once:
  pinMode(I, OUTPUT);
  pinMode(S, OUTPUT);
}

void loop() {
  digitalWrite(S, LOW);
  digitalWrite(I, LOW);
  delay(10);
  digitalWrite(S, LOW);
  digitalWrite(I, HIGH);
  delay(10);
  digitalWrite(S, HIGH);
  digitalWrite(I, HIGH);
  delay(10);
  digitalWrite(S, HIGH);
  digitalWrite(I, LOW);
  delay(10);
  // put your main code here, to run repeatedly:

}
