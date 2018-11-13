int I = 6;
int S = 7;

void setup() {
  // put your setup code here, to run once:
  pinMode(I, OUTPUT);
  pinMode(S, OUTPUT);
}

void loop() {
  digitalWrite(S, HIGH);
  digitalWrite(I, HIGH);
  delay(100);
  digitalWrite(S, LOW);
  digitalWrite(I, HIGH);
  delay(1000);
  digitalWrite(S, LOW);
  digitalWrite(I, LOW);
  delay(100);
  // put your main code here, to run repeatedly:

}
