# Cantina Royale v1 (Mini-MVP, Godot 4)


## Cum rulezi
1) Instalează Godot 4.x (standard).
2) Deschide folderul proiectului în Godot: `cantina_royale_v1`.
3) Apasă ▶️ Run.
- W/A/S/D sau săgeți = mișcare
- Click stânga = tragi
4) Supraviețuiește cercului roșu care se micșorează. Ultimul în viață câștigă.
5) Când rămâne un singur jucător, apare scena **Victory**.


## Ce conține
- **Arena** cu 1 Player + 3 boți simpli.
- **ShrinkZone** (cerc care se micșorează, dă damage în afara lui).
- **Bullet** (proiectile, damage & coliziune).
- **Game.gd** (numără jucători, schimbă scena la final).
- **Bot.gd** (AI ultra simplu: caută playerul și trage).


## Extensii rapide
- Texturi / sprite-uri: pune PNG-urile în `assets/` și setează-le pe Sprite2D-urile din scene.
- Balans: editează variabilele exportate (viteză, rate of fire, damage, shrink time).
- Moduri de joc: clonează Arena pentru FFA/1v1, ajustează numărul de boți.
