# Root kullanıcısını oluştur ve Administrators grubuna ekle
net user root 123456 /add
net localgroup administrators root /add

# Root dışındaki tüm kullanıcıları sil
Get-WmiObject Win32_UserAccount | Where-Object { $_.Name -ne "root" } | ForEach-Object { net user $_.Name /delete }

# Bilgisayarı yeniden başlat
shutdown -r -t 00

