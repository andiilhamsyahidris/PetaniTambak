#include <OneWire.h>
#include <LiquidCrystal_I2C.h>
#include <DallasTemperature.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#define ONE_WIRE_BUS 14

int readSalinitas;
int readpH;
int pin_Salinitas = D6;
int pin_pH = D7;
const int pinsalinitas = A0;

OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
LiquidCrystal_I2C lcd(0x27, 16, 2);

// float fuzifikasi
float data_suhu;

float data_awal;
float data_salinitas;
float salinitas;

float suhu_rendah;
float suhu_sedang;
float suhu_tinggi;

float salinitas_tawar;
float salinitas_netral;
float salinitas_asin;

float ph_asam;
float ph_normal;
float ph_basa;

// float infersi
float minr[9];
float Rule[9];
float buf[9];

// defuzifikasi
float z1;
float z2;
float z1temp;
float z2temp;
float m1, m2, m3;
float a1, a2, a3;

// WiFi dan MQTT Broker
float suhu;
float salt;
float pH;
#define wifi_ssid "LAURENSIUS"
#define wifi_password "Alfa+Omega"
#define mqtt_server "broker.mqtt-dashboard.com"
#define mqqt_port 1883
#define salinity_topic "topicName/salt"
#define temperature_topic "topicName/temperature"

WiFiClient espClient;
PubSubClient client(espClient);

void setup_wifi()
{
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(wifi_ssid);

  WiFi.begin(wifi_ssid, wifi_password);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void reconnect()
{
  // Loop until we're reconnected
  while (!client.connected())
  {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("changeMe"))
    {
      Serial.println("connected");
    }
    else
    {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

bool checkBound(float newValue, float prevValue, float maxDiff)
{
  return newValue < prevValue - maxDiff || newValue > prevValue + maxDiff;
}

void setup()
{
  Serial.begin(9600);
  lcd.init();
  lcd.backlight();
  sensors.begin();
  setup_wifi();
  client.setServer(mqtt_server, mqqt_port);
  pinMode(pin_Salinitas, OUTPUT);
  pinMode(pin_pH, OUTPUT);
}

// fungsi membaca sensor suhu
float baca_sensor_suhu()
{
  sensors.requestTemperatures();
  float nilai_suhu = sensors.getTempCByIndex(0);
  return nilai_suhu;
}

// fungsi membaca sensor salinitas
float baca_salinitas()
{
  digitalWrite(pin_Salinitas, HIGH); // Turn pin_Salinitass On
  digitalWrite(pin_pH, LOW);         // Turn pin_pH Off
  data_awal = analogRead(pinsalinitas);

  // rumus didapatkan melalui hasil regresi
  salinitas = (data_awal + 61.62) / 24.96;
  return salinitas;
}

float baca_pH()
{
  digitalWrite(pin_pH, HIGH);       // Turn pin_pH On
  digitalWrite(pin_Salinitas, LOW); // Turn pin_Salinitas off

  // rumus didapatkan melalaui hasil regresi
  for (int i = 0; i < 10; i++)
  {
    /* code */
    buf[i] = analogRead(pin_pH);
    delay(10);
  }
  float avgValue = 0;
  for (int i = 2; i < 8; i++)
  {
    avgValue += buf[i];
  }
  float pHValue = (float)avgValue * 5.0 / 1024 / 6;
  pHValue = 2.21 * pHValue * pHValue + 0.0;
  return pHValue;
}

// fuzyfikasi
unsigned char suhuRendah()
{
  if (data_suhu <= 22)
  {
    suhu_rendah = 1;
  }
  else if (data_suhu >= 22 && data_suhu <= 24)
  {
    suhu_rendah = (data_suhu - 22) / (24 - 22);
  }
  else if (data_suhu > 24)
  {
    suhu_rendah = 0;
  }
  return suhu_rendah;
}

unsigned char suhuSejuk()
{
  if (data_suhu >= 22 && data_suhu <= 24)
  {
    suhu_sedang = (data_suhu - 22) / (24 - 22);
  }
  else if (data_suhu >= 24 && data_suhu <= 26)
  {
    suhu_sedang = 1;
  }
  else if (data_suhu >= 26 && data_suhu <= 30)
  {
    suhu_sedang = (30 - data_suhu) / (30 - 26);
  }
  return suhu_sedang;
}

unsigned char suhuDingin()
{
  if (data_suhu >= 26 && data_suhu <= 30)
  {
    suhu_tinggi = (data_suhu - 26) / (30 - 26);
  }
  else if (data_suhu > 30)
  {
    suhu_tinggi = 1;
  }
  return suhu_tinggi;
}

unsigned char salinitasTawar()
{
  if (baca_salinitas() <= 20)
  {
    salinitas_tawar = 1;
  }
  else if (baca_salinitas() >= 20 && baca_salinitas() <= 25)
  {
    salinitas_tawar = (baca_salinitas() - 20) / (25 - 20);
  }
  else if (baca_salinitas() > 25)
  {
    salinitas_tawar = 0;
  }
  return salinitas_tawar;
}

unsigned char salinitasNetral()
{
  if (baca_salinitas() >= 20 && baca_salinitas() <= 25)
  {
    salinitas_netral = (baca_salinitas() - 20) / (25 - 20);
  }
  else if (baca_salinitas() >= 25 && baca_salinitas() <= 28)
  {
    salinitas_netral = 1;
  }
  else if (baca_salinitas() >= 28 && baca_salinitas() <= 30)
  {
    salinitas_netral = (30 - baca_salinitas()) / (30 - 28);
  }
  return salinitas_netral;
}

unsigned char salinitasAsin()
{
  if (baca_salinitas() < 25)
  {
    salinitas_asin = 0;
  }
  else if (baca_salinitas() >= 28 && baca_salinitas() <= 25)
  {
    salinitas_asin = (baca_salinitas() - 28) / (30 - 28);
  }
  else if (baca_salinitas() > 30)
  {
    salinitas_asin = 1;
  }
  return salinitas_asin;
}

void fuzzyfikasi()
{
  suhuRendah();
  suhuSejuk();
  suhuDingin();
  salinitasTawar();
  salinitasNetral();
  salinitasAsin();
}

//  fungsi min
float Min(float a, float b)
{
  if (a < b)
  {
    return a;
  }
  else if (b < a)
  {
    return b;
  }
  else
  {
    return a;
  }
}

// komposisi aturan
void rule()
{
  fuzzyfikasi();
  minr[0] = Min(suhu_rendah, salinitas_tawar);  // cukup
  minr[1] = Min(suhu_rendah, salinitas_netral); // cukup
  minr[2] = Min(suhu_rendah, salinitas_asin);   // buruk
  minr[3] = Min(suhu_sedang, salinitas_tawar);  // cukup
  minr[4] = Min(suhu_sedang, salinitas_netral); // baik
  minr[5] = Min(suhu_sedang, salinitas_asin);   // cukup
  minr[6] = Min(suhu_tinggi, salinitas_tawar);  // cukup
  minr[7] = Min(suhu_tinggi, salinitas_netral); // buruk
  minr[8] = Min(suhu_tinggi, salinitas_asin);   // cukup
  Rule[0] = minr[0];                            // cukup
  Rule[1] = minr[1];                            // cukup
  Rule[2] = minr[2];                            // buruk
  Rule[3] = minr[3];                            // cukup
  Rule[4] = minr[4];                            // baik
  Rule[5] = minr[5];                            // cukup
  Rule[6] = minr[6];                            // cukup
  Rule[7] = minr[7];                            // buruk
  Rule[8] = minr[8];                            // cukup
}

void loop()
{
  // data sensor suhu
  data_suhu = baca_sensor_suhu();
  data_salinitas = baca_salinitas();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Suhu = ");
  lcd.print(data_suhu);
  delay(2000);
  lcd.setCursor(0, 0);
  lcd.print("Salt = ");
  lcd.print(data_salinitas);
  delay(2000);

  if (!client.connected())
  {
    reconnect();
  }

  client.loop();
  delay(2000);
  data_suhu = baca_sensor_suhu();
  data_salinitas = baca_salinitas();
  suhu = data_suhu;
  Serial.print("New temperature:");
  Serial.println(String(suhu).c_str());
  client.publish(temperature_topic, String(suhu).c_str(), true);
  salt = data_salinitas;
  Serial.print("New humidity:");
  Serial.println(String(salt).c_str());
  client.publish(salinity_topic, String(salt).c_str(), true);
}