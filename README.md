# D-Bash-Codes

Bu script, bir Windows bilgisayarında otomatik olarak bir dizi işlem gerçekleştirir. Ancak, bu tür bir scriptin kullanılması dikkatlice düşünülmelidir ve güvenlik konularına özen gösterilmelidir.

## İşlevler

- Root Kullanıcısı Oluşturulur ve Administrators Grubuna Eklenir:
  - **net user root 123456 /add**: **"root"** adında bir kullanıcı oluşturulur ve şifresi **"123456"** olarak ayarlanır.
  - **net localgroup administrators root /add**: Oluşturulan **"root"** kullanıcısı **"Administrators"** grubuna eklenir.
- Root Dışındaki Tüm Kullanıcılar Silinir:
  - **Get-WmiObject Win32_UserAccount**: Windows yönetim nesnelerinden tüm kullanıcı hesaplarını alır.
  - **Where-Object { $_.Name -ne "root" }**: **"root"** dışındaki tüm kullanıcıları filtreler.
  - **ForEach-Object { net user $_.Name /delete }**: Seçilen kullanıcıları siler.
- Bilgisayar Yeniden Başlatılır:
  - **shutdown -r -t 00**: Bilgisayarı hemen yeniden başlatır.

## Kullanım

- Bu scripti kullanmadan önce, güvenlik konularını dikkatlice gözden geçirin.
- Scriptin çalışabilmesi için yeterli yetkiye sahip olmalısınız (örneğin, yönetici olarak çalıştırılmalıdır).
- Scripti çalıştırmadan önce, kullanıcı adı ve şifre gibi hassas bilgilerinizi güvende tutun.

## Uyarılar

- Bu scriptin kullanılması, bilgisayarın güvenliğini ciddi şekilde etkileyebilir. Dikkatli olunmalı ve sadece gerektiğinde kullanılmalıdır.
- Scriptinizi güvenli bir şekilde saklayın ve sadece ihtiyaç duyulduğunda kullanın.
- Script, kullanıcıların onayı olmadan bilgisayarda değişiklikler yapabilir.

## Sorumluluk Reddi

Bu scriptin kullanımından kaynaklanan herhangi bir sorundan geliştirici sorumlu değildir. Scripti kullanmadan önce, yerel yasalara ve güvenlik politikalarına uygun olduğundan emin olun.
