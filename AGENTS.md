# AGENTS.md — แอป Flutter ของ NightOut

กติกาสำหรับ AI agent (Cursor / Claude Code) และคนที่ทำงานใน repo นี้ · วางไฟล์นี้ไว้ที่ root ของ repo Flutter

## เอกสารอ้างอิง (อ่านก่อนเริ่มงาน)
- `docs/nightout/README.md` — env, การเรียก API, Auth, asset และกฎธุรกิจ
- `docs/nightout/THEME.md` — ธีม Midnight Gold + โค้ด `NightOutColors` / `nightOutTheme()`
- backend อยู่ใน repo `genminigpt/NightList` (monorepo เว็บ) — body / response / รหัส error ดูได้จาก `packages/contracts/src/<domain>.ts` หรือ Swagger https://night-out-demo.vercel.app/api/docs · เว็บสำหรับเทียบหน้าจอ: https://night-out-demo.vercel.app

## ภาษา
- ข้อความ UI เป็นภาษาไทย · โค้ด ชื่อตัวแปร และ commit เป็นภาษาอังกฤษ
- commit แบบ Conventional Commits: `feat(booking): …`, `fix(auth): …`

## ธีม
- ใช้สีจาก `Theme.of(context).extension<NightOutColors>()!` หรือ `colorScheme` เท่านั้น **ห้ามพิมพ์ `Color(0x…)` ในวิดเจ็ต**
- ธีมมืดเป็นค่าเริ่มต้น · ผู้ใช้เลือก DARK / LIGHT / SYSTEM ได้ (เก็บใน key `nightout-theme`)
- ฟอนต์: IBM Plex Sans Thai (ทั้งแอป) · Playfair Display (หัวข้อภาษาอังกฤษ) · ไอคอน: `phosphor_flutter` เท่านั้น
- ทอง / ม่วงเป็นสีเน้น ห้ามทาพื้นที่ใหญ่ · โหมดสว่างตัวอักษรทองใช้ `goldText` ห้ามใช้ `gold`
- เคารพการตั้งค่าลดการเคลื่อนไหว (`MediaQuery.disableAnimations`)

## ข้อมูลและ API
- **อ่านและเขียนข้อมูลผ่าน NestJS (`API_BASE_URL`) เท่านั้น** · `supabase_flutter` ใช้ได้เฉพาะ `supabase.auth.*` ห้ามเรียก `from()` / `rpc()` / `storage`
- ค่า env อ่านด้วย `String.fromEnvironment` (รันด้วย `--dart-define-from-file=.env.dev`) · ห้าม hardcode URL / key ในโค้ด · ห้าม commit ไฟล์ `.env*`
- HTTP client มีตัวเดียว (Dio) + interceptor:
  - ใส่ `Authorization: Bearer <accessToken ของ Supabase>`
  - แกะ `{ status, status_code, data, code, err_msg }` → สำเร็จคืน `data` · ไม่สำเร็จ throw `ApiException(code, errMsg, statusCode)`
  - `err_msg` เป็นภาษาไทยแล้ว แสดงให้ผู้ใช้ได้เลย · ตัดสินใจในโค้ดจาก `code`
- JSON เป็น snake_case → `@JsonSerializable(fieldRename: FieldRename.snake)`
- อัปโหลดไฟล์: `POST /storage/upload-url` แล้ว PUT ไฟล์ตรงไปที่ URL ที่ได้

## Auth
- มีแค่ email + password และ Google / Facebook (Supabase OAuth) · **ห้ามเพิ่ม OTP หรือ provider อื่น**
- redirect กลับแอปด้วย `AUTH_REDIRECT_URL` (`nightout://auth-callback`)

## กฎธุรกิจที่ห้ามพลาด
- จองได้**เฉพาะโต๊ะ** + เลือกโปรของร้านได้ 1 อย่าง · ไม่มีสั่งอาหาร/เครื่องดื่มล่วงหน้า · เมนูแสดงไว้ประเมินงบเท่านั้น
- เงินที่จ่ายผ่านแอปเรียกว่า **"ค่าธรรมเนียมจองโต๊ะ (Table Fee)"** เท่านั้น
- ห้ามคำว่า "ขายเหล้า/เบียร์" · โปรโมชันห้ามลด/แถมแอลกอฮอล์
- ป้ายความปลอดภัย: **"ข้อมูลอ้างอิงจากร้านค้า (Merchant Declared)"** + วันที่ตรวจล่าสุด · ห้ามใช้ "Safety Verified" / "ยืนยันโดย NightOut"
- Checkout ต้องกรอกเบอร์โทร + ติ๊กยอมรับเงื่อนไขริบมัดจำ
- QR เช็กอิน = `NIGHTOUT:<booking id>`
- สถานะคนในร้านแสดงทั้งจุดสีและคำ (ว่าง / ใกล้เต็ม / เต็ม)
- แผนที่: `maplibre_gl` + OpenFreeMap · ห้ามใช้ Google Maps API
- **ห้ามทำ flow โอนเงิน + แนบสลิป** — มัดจำจะเปลี่ยนเป็น Beam Payment (Escrow) ให้รอ API

## ของนอกแผน
- ฟีเจอร์ที่ไม่มีใน `docs/nightout/README.md` หรือ requirement ของเว็บ **ให้ถามเจ้าของงานก่อนเริ่มทำ** ห้ามเดาเอง
