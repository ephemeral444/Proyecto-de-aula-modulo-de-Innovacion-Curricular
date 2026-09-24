# 8_tasks.md — Fases, turnos y commits (v1)

Antes de cada fase: hacer el `fetch` + `merge` de la rama del compañero
(ver `docs/GIT_FLUJO_RAMAS.md` §4). El repo indicado es donde se hace el
commit de esa fase. El turno alterna Integrante 1 / Integrante 2.

## Fase 0 — Esqueleto + spec kit (AMBOS REPOS) — turno: Integrante 1
- [ ] Repo API: `docs/spec_kit/` completo (este spec kit), `db/` (script
  + init.sh), carpetas vacías de `api_innovacion/` (Controllers,
  Modelos, Peticiones, Servicios, Repositorios, Excepciones, pruebas)
- [ ] Repo front: carpetas vacías de `front_blazor/`, README que enlaza
  al spec kit del repo de la API
- [ ] Commit en `rama-integrante1` de los dos repos: `"Fase 0 — Esqueleto y spec kit"`
**Verificar:** las carpetas existen; los 11 documentos del spec kit están.

## Fase 1 — Los modelos (REPO API) — turno: Integrante 2
- [ ] Traer `rama-integrante1` → `rama-integrante2` (repo API)
- [ ] `Modelos/{AreaConocimiento,Universidad,AspectoNormativo,PracticaEstrategia,Enfoque,CarInnovacion,Aliado}.cs`
- [ ] Commit: `"Fase 1 — Los modelos"`
**Verificar:** `dotnet build` compila (aunque falten las demás capas, el modelo solo no depende de nada).

## Fase 2 — Peticiones y la excepción (REPO API) — turno: Integrante 1
- [ ] Traer `rama-integrante2` → `rama-integrante1`
- [ ] 21 clases de petición (3 por recurso × 7) + `Excepciones/NoEncontradoExcepcion.cs`
- [ ] Commit: `"Fase 2 — Peticiones y la excepcion"`
**Verificar:** compila; Crear/Reemplazo/Actualizar son clases distintas por recurso.

## Fase 3 — Repositorios SQL Server (REPO API) — turno: Integrante 2
- [ ] Traer `rama-integrante1` → `rama-integrante2`
- [ ] `IRepositorioX` / `RepositorioXSqlServer` para las 7, con Dapper y `@parametros`
- [ ] Commit: `"Fase 3 — Repositorios"`
**Verificar:** conectando a la base ya cargada, una consulta manual trae filas reales.

## Fase 4 — Servicios y prueba de capas (REPO API) — turno: Integrante 1
- [ ] Traer `rama-integrante2` → `rama-integrante1`
- [ ] `IServicioX` / `ServicioX` para las 7
- [ ] `pruebas/`: repositorio falso en memoria + prueba de al menos un servicio
- [ ] Commit: `"Fase 4 — Servicios y prueba de capas"`
**Verificar:** `dotnet run` en `pruebas/` pasa sin conexión a SQL Server.

## Fase 5 — Controllers y Program.cs (REPO API) — turno: Integrante 2
- [ ] Traer `rama-integrante1` → `rama-integrante2`
- [ ] 7 controllers, DI de las 14 clases (7 servicios + 7 repositorios) en `Program.cs`
- [ ] Commit: `"Fase 5 — Controllers y Program.cs"`
**Verificar:** los 6 endpoints × 7 recursos responden (criterios 1-6 de `2_spec.md`).

## Fase 6 — El front (REPO FRONT) — turno: Integrante 1
- [ ] Traer `rama-integrante2` → `rama-integrante1` (en el repo del FRONT esta vez)
- [ ] 7 servicios HTTP + 7 páginas Razor, `Program.cs`, `NavMenu.razor`
- [ ] Commit: `"Fase 6 — El front"`
**Verificar:** con la API corriendo suelta (sin Docker todavía), el front lista y crea las 7.

## Fase 7 — Docker: un solo comando (AMBOS REPOS) — turno: Integrante 2
- [ ] `Dockerfile` en el repo API y en el repo front
- [ ] `docker-compose.yml` en el repo API (contexto `../front_innovacion`, ver C2/D1)
- [ ] Commit en cada repo: `"Fase 7 — Docker"`
**Verificar:** `docker compose down -v && docker compose up -d --build` desde cero, con los dos repos clonados como hermanos, levanta todo (criterio 9).

## Fase 8 — Cierre (AMBOS REPOS, LOS DOS INTEGRANTES) — turno: los dos
- [ ] `9_checklist.md` firmado
- [ ] Smoke test completo de `7_quickstart.md` pasando desde cero
- [ ] PR de la rama con todo lo más reciente hacia `main` (encargado del main revisa y hace merge)
- [ ] Tag `v1` en `main`, en los dos repos
- [ ] Enlaces de los dos repos y del tag, listos para entregar
**Verificar:** todo lo anterior, desde una máquina limpia.