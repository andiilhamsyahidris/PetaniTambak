#include <OneWire.h>
#include <LiquidCrystal_I2C.h>
#include <DallasTemperature.h>

// pin lcd 
LiquidCrystal_I2C lcd(0x27,16,2);

// pin sensor suhu 
#define ONE_WIRE_BUS 14
float data_suhu;
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

// pin sensor salinitas
const int pinsalinitas = A0;
float data_awal;
float data_salinitas;
float salinitas;

void setup() {
  // Start the Serial Monitor
  Serial.begin(9600);
  // inisialiasi lcd dan tampilkan pesan pada lcd 
  lcd.init();
  lcd.backlight();
  sensors.begin();
}

// fungsi membaca sensor suhu
float baca_sensor_suhu(){
  sensors.requestTemperatures(); 
  float nilai_suhu = sensors.getTempCByIndex(0);
  return nilai_suhu;
}

// fungsi membaca sensor salinitas
float baca_salinitas(){
  data_awal = analogRead(pinsalinitas);
  salinitas = (data_awal+61.62)/24.96;
  return salinitas;
}

void loop() {
  // data sensor suhu
  data_suhu=baca_sensor_suhu();
  data_salinitas=baca_salinitas();

  // tampilkan pada lcd
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Suhu = ");
  lcd.print(data_suhu);
  Serial.println("Temperature is: ");
  Serial.println(data_suhu);
  delay(2000);
  
  lcd.setCursor(0, 0);
  lcd.print("Salt = ");
  lcd.print(data_salinitas);
  Serial.println("Salinitas is: ");
  Serial.println(data_salinitas);
  delay(2000);
  }
