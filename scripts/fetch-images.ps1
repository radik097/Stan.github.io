# Downloads remote images to assets/images with stable filenames
param(
  [string]$OutDir = $(Join-Path $PSScriptRoot '..' 'assets' 'images')
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$images = @(
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t39.30808-6/559094588_122098734261065833_1324753359694332935_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_ohc=nfU2BhrkX24Q7kNvwH0IAsK&_nc_oc=AdmwWzfW7067scgjbNdmEykcEB47clkPxP9yXkoh8BVc7_3xvl149OhldxBtNXTslI4&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=hXrVWQasW3hDJVhk91KVfg&oh=00_Afd6EfSa7iS7l9vFfAmvjjlO0scUpGcv1MBClcL9Lze2PQ&oe=68FF8DD8'; name = 'work-1.jpg' }
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t39.30808-6/561046004_122098734273065833_6426587242540028962_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_ohc=Au0Key9l96kQ7kNvwFwoE8t&_nc_oc=AdkrDAj18Ix-2UR-Y9_lfsWq7saK6O9iOt85_PEo_HC7vij25b1NAu0s970E8B7P5Zc&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=2iRu-mQ5KOCzZcnKxFGxNQ&oh=00_AffPhB2k3BXBHljeykp9KJLf_sinJfEcpVKuoT0x7tUBwA&oe=68FF6236'; name = 'work-2.jpg' }
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t39.30808-6/559020913_122097118239065833_3233818107632234695_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_ohc=MVorAZ6ot4YQ7kNvwG4a523&_nc_oc=AdklDTqAQ1K66YWjYRUDRnFKQbfUFYYrCixyZEW4o9PooZNcwroBhZZYbu_nTwrjgJg&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=-RJyY1U9-MCuUzPhCaplvQ&oh=00_Afcm6M0o97HX7v_aas0DBk7SuT4nNPUk4Ada02_3QInCxg&oe=68FF7EBA'; name = 'work-3.jpg' }
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t51.82787-15/560358525_17844334287589747_1867315546270757240_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_ohc=zSphBn7ZvToQ7kNvwHkkDZ5&_nc_oc=AdlVgiqvrDAT3zQsUeKr6iYmKa6KRuIf9WoWlmH4805QIFc_Vu5jxMpyoPZ7bnM5Q9M&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=ycmk_uOkaL-uouK2ieZ8mg&oh=00_AfcaDFZeRXbU4p2Md7YJE_tiG0DaQ4lMGqhy0HIDal6qGg&oe=68FF6F8D'; name = 'work-4.jpg' }
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t39.30808-6/558954300_122095086375065833_8434583287107771559_n.jpg?stp=dst-jpg_p526x296_tt6&_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=D0ALmsuRrTgQ7kNvwH3ukQe&_nc_oc=AdleYESjcbTjp9cVE1s_X7zTx0zahMVhrwHJOIChGzpI5Gnkv9r13f3zOryU53DOrWc&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=xmUpz7ggb7OJa64LeAB7-w&oh=00_AfetX-g0B4ek13FoIe_xvaYnqlqd3VrOV1KKLtMuxFeOmg&oe=68FF7E97'; name = 'work-5.jpg' }
  @{ url = 'https://scontent.fmel18-1.fna.fbcdn.net/v/t39.30808-6/558356922_122095017411065833_18280156597737695_n.jpg?stp=dst-jpg_p180x540_tt6&_nc_cat=107&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=-1h0OVrrqZAQ7kNvwHnGUJk&_nc_oc=AdkFCTnUOktGViNyH-y2JVgPKprNdffc9J-Q-4ntGkvPst0x73UHiaelpatexSFAPcI&_nc_zt=23&_nc_ht=scontent.fmel18-1.fna&_nc_gid=oy1ff0AKgOD8p5vUGZuwgg&oh=00_AfcOcxs02JnTwo4JXB0IT0FUpNa1UiiRx4iS282lrLE5Tg&oe=68FF74FF'; name = 'work-6.jpg' }
)

foreach ($img in $images) {
  $dest = Join-Path $OutDir $img.name
  Write-Host "Downloading $($img.url) -> $dest"
  Invoke-WebRequest -Uri $img.url -OutFile $dest -UseBasicParsing
}

Write-Host "Done. Images in: $OutDir"
