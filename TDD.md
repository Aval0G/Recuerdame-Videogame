![](./image1.png){width="6.267716535433071in"
height="2.4166666666666665in"}

**Facultad de Telemática**

**Materia:**

**Desarrollo de Videojuegos**

**Académico:**

**Ramírez Ortiz Miguel Ángel**

**Alumnos:**

**Ernesto Vega Velasco**

**Kevin Gutierrez Torres**

**Aldo Eduardo Valdez**

**Colima, Col; a 29 Septiembre del 2025**

## **1. Lista de Características Obtenidas del GDD**

### **1.1 Características Principales del Juego**

Basándose en el Game Design Document, las características técnicas clave
que deben implementarse son:

**Mecánicas de Juego:**

-   Sistema de movimiento point-and-click con controles WASD

-   Sistema de inventario simple (máximo 5 elementos)

-   Sistema de interacción con objetos del entorno

-   Mecánica de flashbacks activados por triggers específicos

-   Sistema de deducción para resolver puzzles

-   Detección de objetos interactivos con feedback visual del cursor

**Características Narrativas:**

-   Sistema de revelación progresiva de historia

-   Manejo de estados de memoria del protagonista

-   Sistema de cinemáticas para flashbacks

-   Interfaz minimalista que maximiza la inmersión

**Características Ambientales:**

-   Entorno 3D de cabaña con 3 habitaciones interconectadas

-   Sistema de iluminación atmosférica (tenue y contrastada)

-   Paleta de colores fríos para generar suspense

-   Efectos visuales para transiciones entre recuerdos

### **1.2 Requerimientos Técnicos Derivados**

-   Motor gráfico 3D con soporte para iluminación dinámica

-   Sistema de física básica para interacciones

-   Gestión de estados de juego complejos

-   Sistema de UI adaptable y minimalista

-   Soporte para efectos post-procesamiento

-   Sistema de audio espacial

##  

## **2. Elección de Game Engine**

### **2.1 Motor Seleccionado: Unity 2023.3 LTS**

**Justificación de la Elección:**

**Ventajas para el Proyecto:**

-   **Facilidad de Desarrollo Point-and-Click:** Unity ofrece un sistema
    > robusto de Raycasting que es ideal para detectar objetos
    > clickeables en entornos 3D

-   **Pipeline de Renderizado URP:** Universal Render Pipeline permite
    > crear la atmósfera noir requerida con iluminación tenue y efectos
    > de post-procesamiento

-   **Timeline System:** Perfecto para crear las secuencias de
    > flashbacks con transiciones cinematográficas

-   **NavMesh System:** Útil para el movimiento del personaje en el
    > espacio 3D de la cabaña

-   **Asset Store:** Acceso a assets gratuitos para acelerar el
    > desarrollo (texturas de madera, efectos de partículas, etc.)

**Capacidades Específicas a Aprovechar:**

-   **Cinemachine:** Para cámaras cinematográficas durante flashbacks

-   **Post-Processing Stack:** Para efectos de memoria distorsionada y
    > atmósfera noir

-   **UI Toolkit:** Para crear interfaces minimalistas e inmersivas

-   **Audio Mixer:** Para audio espacial y efectos atmosféricos

-   **Input System:** Para manejo intuitivo de controles point-and-click
    > y WASD

### **2.2 Alternativas Consideradas**

-   **Unreal Engine:** Descartado por su complejidad innecesaria para un
    > proyecto de alcance académico

-   **Godot:** Considerado pero descartado por menor soporte de assets y
    > comunidad más pequeña

-   **GameMaker Studio:** Orientado principalmente a 2D, no adecuado
    > para el entorno 3D requerido

## **3. Planeación (Diagrama de Gantt)**

### **3.1 Cronograma de Desarrollo (12 semanas)**

Semana 1-2: PREPRODUCCIÓN

├── Configuración del proyecto Unity

├── Importación de assets base

├── Prototipo de mecánicas core

└── Setup del control de versiones

Semana 3-4: NIVEL Y ENTORNO

├── Modelado de la cabaña (blocking)

├── Configuración de iluminación básica

├── Sistema de navegación y movimiento

└── Pruebas de mecánicas de interacción

Semana 5-6: SISTEMAS CORE

├── Sistema de inventario

├── Sistema de detección de objetos

├── Lógica de recolección de pistas

└── Interface de usuario básica

Semana 7-8: NARRATIVA Y FLASHBACKS

├── Sistema de flashbacks

├── Integración de audio

├── Sistema de deducción/puzzles

└── Cinemáticas básicas

Semana 9-10: ARTE Y AUDIO

├── Finalización de modelos 3D

├── Texturas y materiales

├── Efectos de sonido

└── Música atmosférica

Semana 11: INTEGRACIÓN Y PULIDO

├── Testing y debugging

├── Optimización de performance

├── Ajustes de gameplay

└── UI/UX final

Semana 12: FINALIZACIÓN

├── Build final

├── Testing exhaustivo

├── Documentación

└── Preparación para distribución

### **3.2 Hitos Críticos**

-   **Semana 2:** Prototipo jugable básico (movimiento + interacción)

-   **Semana 4:** Entorno completo navegable

-   **Semana 6:** Todos los sistemas core implementados

-   **Semana 8:** Narrativa integrada y funcional

-   **Semana 10:** Versión alpha completa

-   **Semana 12:** Gold master para distribución

## **4. Diagramas de Alto Nivel**

### **4.1 Arquitectura de Software**

CAPA DE PRESENTACIÓN

├── UI Manager

│ ├── Inventory UI

│ ├── Deduction Panel

│ └── HUD Controller

├── Audio Manager

├── Visual Effects Manager

└── Input Handler

CAPA DE LÓGICA DE JUEGO

├── Game Manager (Singleton)

│ ├── Game State Controller

│ ├── Scene Transition Manager

│ └── Save/Load System

├── Player Controller

├── Interaction System

│ ├── Interactable Objects

│ ├── Trigger System

│ └── Feedback Controller

└── Puzzle System

├── Clue Manager

├── Deduction Logic

└── Progress Tracker

CAPA DE DATOS

├── Game Data (ScriptableObjects)

│ ├── Clue Data

│ ├── Flashback Data

│ └── Dialogue Data

├── Player Progress Data

└── Audio/Visual Assets

### **4.2 Diagrama de Estados del Juego**

INICIO

├── EXPLORACIÓN

│ ├── Navegando

│ ├── Examinando Objeto

│ └── Recolectando Pista

├── INVENTARIO ABIERTO

├── FLASHBACK

│ ├── Reproduciendo Memoria

│ └── Regresando a Realidad

├── PUZZLE DE DEDUCCIÓN

│ ├── Arrastrando Pistas

│ ├── Verificando Combinación

│ └── Resultado (Correcto/Incorrecto)

└── FINAL

├── Cinemática Final

└── Créditos

### **4.3 Arquitectura de Escena**

SCENE HIERARCHY

├── Environment

│ ├── Cabin Structure

│ ├── Furniture

│ └── Interactive Objects

├── Lighting

│ ├── Main Directional Light

│ ├── Ambient Lighting

│ └── Mood Lights

├── Player

│ ├── Character Controller

│ ├── Camera System

│ └── Interaction Raycast

├── UI Canvas

│ ├── Inventory Panel

│ ├── Deduction Interface

│ └── Feedback Elements

└── Managers

├── Game Manager

├── Audio Manager

└── Scene Manager

##  

## **5. Herramientas de Arte**

### **5.1 Modelado 3D**

-   **Blender 4.0:** Herramienta principal para modelado de la cabaña,
    > muebles y objetos interactivos

-   **Justificación:** Gratuito, potente, excelente integración con
    > Unity, gran comunidad de soporte

### **5.2 Texturización**

-   **Substance Painter:** Para texturas PBR de alta calidad en objetos
    > clave

-   **GIMP:** Para texturas simples y correcciones

-   **Justificación:** Substance Painter ofrece resultados
    > profesionales, GIMP es gratuito para tareas básicas

### **5.3 Concepto Art y UI**

-   **Figma:** Para diseño de interfaces y mockups

-   **Krita:** Para concept art y elementos 2D

-   **Justificación:** Herramientas especializadas que permiten flujo de
    > trabajo eficiente

### **5.4 Efectos Visuales**

-   **Unity VFX Graph:** Para efectos de partículas (humo, polvo,
    > efectos de memoria)

-   **Unity Shader Graph:** Para shaders personalizados de flashbacks

-   **Justificación:** Integración nativa con Unity, performance
    > optimizado

### **5.5 Pipeline de Importación**

-   **Formatos de Archivo:**

    -   Modelos 3D: .fbx (desde Blender)

    -   Texturas: .png para UI, .jpg para texturas de entorno

    -   Audio: .wav para efectos, .ogg para música de fondo

## **6. Objetos 3D, Terreno y Escenas**

### **6.1 Estructura de Escenas**

**Escena Principal: Cabin_Interior**

-   **Habitación Principal:** Sala de estar con sofá, chimenea, mesa de
    > centro

-   **Baño:** Espejo (trigger de flashback), lavabo, objetos de aseo
    > personal

-   **Estudio:** Escritorio, estantería, cuerpo de la víctima, pizarra
    > de corcho

### **6.2 Objetos 3D Principales**

**Assets Personalizados:**

-   Estructura de cabaña (paredes, pisos, techos)

-   Muebles específicos (escritorio del detective, estantería con
    > libros)

-   Objetos interactivos (placa de detective, carta, frasco de veneno)

**Assets de Store:**

-   Muebles genéricos (sofá, sillas, mesa)

-   Props ambientales (libros, lámparas, decoración)

-   Texturas de madera y materiales

### **6.3 Optimización de Modelos**

-   **LOD System:** Implementación de 2 niveles de detalle para objetos
    > complejos

-   **Occlusion Culling:** Para optimizar renderizado en espacios
    > interiores

-   **Texture Atlasing:** Combinación de texturas pequeñas en atlas
    > 1024x1024

-   **Polygon Budget:** Máximo 50,000 triángulos por escena total

###  

### **6.4 Iluminación y Atmósfera**

**Setup de Iluminación:**

-   **Iluminación Global:** Unity\'s Progressive Lightmapper

-   **Luces Principales:**

    -   Luz direccional suave simulando luz de ventana

    -   Point lights para lámparas interiores

    -   Spot light para escritorio (foco de atención)

**Configuración Atmosférica:**

-   **Fog:** Exponential fog para profundidad

-   **Post-Processing:**

    -   Color Grading: Tonos fríos, contraste alto

    -   Bloom: Sutil para highlights

    -   Vignette: Para enfoque central

##  

## **7. Detección de Colisiones, Físicas e Interacciones**

### **7.1 Sistema de Colisiones**

**Implementación Técnica:**

// Sistema principal de detección de interactables

public class InteractionSystem : MonoBehaviour

{

\[SerializeField\] private LayerMask interactableLayer;

\[SerializeField\] private float interactionRange = 5f;

private Camera playerCamera;

void Update()

{

HandleMouseInput();

}

private void HandleMouseInput()

{

if (Input.GetMouseButtonDown(0))

{

Ray ray = playerCamera.ScreenPointToRay(Input.mousePosition);

if (Physics.Raycast(ray, out RaycastHit hit, interactionRange,
interactableLayer))

{

IInteractable interactable =
hit.collider.GetComponent\<IInteractable\>();

interactable?.Interact();

}

}

}

}

**Capas de Colisión:**

-   **Default:** Geometría estática de la cabaña

-   **Interactable:** Objetos con los que el jugador puede interactuar

-   **Player:** Cápsula del personaje para navegación

-   **Trigger:** Zonas invisibles para activar eventos

###  

### **7.2 Sistema de Física**

**Configuración de Rigidbodies:**

-   **Objetos Estáticos:** Static Colliders únicamente

-   **Objetos Interactivos:** Kinematic Rigidbodies para animaciones
    > controladas

-   **Gravedad:** Reducida a -5 m/s² para sensación más cinematográfica

**Physics Materials:**

-   **Wood:** Fricción 0.6, Bounciness 0.1

-   **Paper:** Fricción 0.8, Bounciness 0.0

-   **Metal:** Fricción 0.4, Bounciness 0.3

### **7.3 Sistema de Interacciones**

**Jerarquía de Interactables:**

public interface IInteractable

{

void Interact();

void OnHoverEnter();

void OnHoverExit();

}

public class ClueItem : MonoBehaviour, IInteractable

{

\[SerializeField\] private ClueData clueData;

\[SerializeField\] private bool isCollected = false;

public void Interact()

{

if (!isCollected)

{

InventoryManager.Instance.AddClue(clueData);

isCollected = true;

gameObject.SetActive(false);

}

}

}

**Feedback Visual:**

-   **Cursor Changes:** Cursor cambia a mano al pasar sobre
    > interactables

-   **Outline Shader:** Contorno dorado en objetos al hacer hover

-   **Particle Effects:** Brillo sutil en pistas importantes

## **8. Lógica de Juego e Inteligencia Artificial**

### **8.1 Game State Management**

**Estados Principales del Juego:**

public enum GameState

{

Intro,

Exploring,

InventoryOpen,

Flashback,

DeductionPuzzle,

Ending

}

public class GameManager : MonoBehaviour

{

public static GameManager Instance;

\[SerializeField\] private GameState currentState;

public void ChangeState(GameState newState)

{

ExitState(currentState);

currentState = newState;

EnterState(currentState);

}

}

### **8.2 Sistema de Progreso**

**Tracking de Pistas:**

-   **Clue Collection:** Sistema de flags booleanos para pistas
    > recolectadas

-   **Progress Gates:** Ciertos eventos se desbloquean solo con pistas
    > específicas

-   **Memory Reconstruction:** El progreso del jugador determina qué
    > flashbacks están disponibles

###  

### **8.3 Lógica de Deducción**

**Sistema de Puzzle Principal:**

public class DeductionPuzzle : MonoBehaviour

{

\[SerializeField\] private ClueData\[\] requiredClues = new
ClueData\[3\];

\[SerializeField\] private ClueData\[\] playerSubmission = new
ClueData\[3\];

public bool ValidateDeduction()

{

return requiredClues.SequenceEqual(playerSubmission);

}

private void OnCorrectDeduction()

{

// Activar cinemática final

// Revelar ubicación de llaves

// Transición a estado de final

}

}

### **8.4 IA Ambiental (No hay NPCs activos)**

**Sistemas de Simulación:**

-   **Audio Reactivo:** Sonidos ambientales que responden a las acciones
    > del jugador

-   **Lighting Mood:** Cambios sutiles de iluminación basados en el
    > progreso narrativo

-   **Environmental Storytelling:** Objetos que aparecen o se mueven
    > ligeramente para guiar al jugador

**Behavioral Trees (Futuras Expansiones):**

-   **Diseño Modular:** Preparación para futuros episodios con NPCs

-   **Utility-Based AI:** Para personajes con múltiples motivaciones

-   **State Machine:** Para comportamientos complejos de antagonistas

## **9. Networking (No Aplica)**

Este proyecto es un juego single-player, por lo que no requiere
implementación de networking. Sin embargo, se consideran las siguientes
características para futuras expansiones:

### **9.1 Preparación para Futuras Características**

**Arquitectura Preparada para:**

-   **Leaderboards:** Tiempos de resolución de casos

-   **Shared Investigation:** Modo cooperativo donde múltiples jugadores
    > pueden investigar juntos

-   **Async Multiplayer:** Comparación de deducciones entre jugadores

**Tecnologías Consideradas:**

-   **Unity Netcode for GameObjects:** Para futuro modo cooperativo

-   **Mirror Networking:** Alternativa open-source

-   **Photon PUN2:** Para funciones sociales básicas

## **10. Audio y Efectos Visuales**

### **10.1 Sistema de Audio**

**Arquitectura de Audio:**

public class AudioManager : MonoBehaviour

{

\[SerializeField\] private AudioSource musicSource;

\[SerializeField\] private AudioSource sfxSource;

\[SerializeField\] private AudioSource ambientSource;

public void PlaySFX(AudioClip clip, float volume = 1f)

{

sfxSource.PlayOneShot(clip, volume);

}

public void PlayFlashbackAudio(AudioClip memorySound)

{

// Audio procesado con efectos de memoria distorsionada

}

}

**Categorías de Audio:**

-   **Música Ambiental:** Drones atmosféricos, 60-80 BPM, tonalidades
    > menores

-   **Efectos de Sonido:** Pasos, puertas, papel, interacciones con
    > objetos

-   **Audio Espacial:** 3D positioning para inmersión en la cabaña

-   **Efectos de Flashback:** Audio distorsionado, eco, reverb

### **10.2 Herramientas de Audio**

**Creación y Edición:**

-   **Reaper:** Para grabación y edición de audio

-   **Freesound.org:** Biblioteca de efectos de sonido

-   **Unity Audio Mixer:** Para mixing dinámico en tiempo real

**Implementación Técnica:**

-   **Audio Zones:** Diferentes ambientes sonoros por habitación

-   **Distance Attenuation:** Sonidos que se desvanecen con la distancia

-   **Occlusion:** Sonidos amortiguados por paredes

### **10.3 Efectos Visuales**

**Post-Processing Pipeline:**

public class FlashbackEffect : MonoBehaviour

{

\[SerializeField\] private Volume postProcessVolume;

\[SerializeField\] private ColorAdjustments colorSettings;

public void TriggerFlashbackEffect()

{

// Desaturación gradual

// Cambio a sepia/monocromático

// Efecto de estática/ruido

// Transición suave de regreso

}

}

**Efectos Principales:**

-   **Memory Distortion:** Chromatic aberration, desaturación

-   **Noir Atmosphere:** Alto contraste, sombras marcadas

-   **Particle Systems:** Polvo en rayos de luz, humo sutil

-   **Screen-Space Reflections:** Para superficies como espejos

**Performance Considerations:**

-   **LOD para VFX:** Efectos se simplifican basados en distancia

-   **Culling:** Efectos no visibles se desactivan

-   **Target:** Mantener 60 FPS en hardware medio

## **11. Plataforma y Requerimientos de Software**

### **11.1 Plataforma Objetivo**

**Primaria: PC (Windows)**

-   **Distribución:** itch.io

-   **Resolución Target:** 1920x1080 (escalable desde 1280x720)

-   **Input Methods:** Mouse y Teclado

-   **Architecture:** x64

**Consideraciones Futuras:**

-   **macOS:** Viable con builds adicionales de Unity

-   **Linux:** Posible pero no prioritario para versión inicial

-   **WebGL:** Considerado para mayor accesibilidad

### **11.2 Requerimientos del Sistema**

**Mínimos:**

-   **OS:** Windows 10 64-bit

-   **Processor:** Intel i3-4170 / AMD FX-6300

-   **Memory:** 4 GB RAM

-   **Graphics:** GTX 750 Ti / R7 260X

-   **DirectX:** Version 11

-   **Storage:** 2 GB available space

**Recomendados:**

-   **OS:** Windows 11 64-bit

-   **Processor:** Intel i5-8400 / AMD Ryzen 5 2600

-   **Memory:** 8 GB RAM

-   **Graphics:** GTX 1060 / RX 580

-   **DirectX:** Version 12

-   **Storage:** 4 GB available space (SSD recomendado)

### **11.3 Herramientas de Desarrollo**

**Desarrollo:**

-   **Unity 2023.3 LTS** - Motor principal

-   **Visual Studio 2022** - IDE para programación

-   **Git + Git LFS** - Control de versiones

-   **Unity Hub** - Gestión de versiones de Unity

**Arte y Audio:**

-   **Blender 4.0** - Modelado 3D

-   **Substance Painter** - Texturización

-   **GIMP/Photoshop** - Edición 2D

-   **Reaper** - Audio

-   **Figma** - UI/UX Design

**Testing y Deploy:**

-   **Unity Cloud Build** - Builds automatizados

-   **Butler (itch.io)** - Deployment automático

-   **OBS Studio** - Captura para trailers/marketing

### **11.4 Consideraciones de Performance**

**Optimization Targets:**

-   **Frame Rate:** Estable 60 FPS en hardware recomendado

-   **Loading Times:** Máximo 5 segundos entre habitaciones

-   **Memory Usage:** Máximo 2GB RAM total

-   **Build Size:** Objetivo menor a 1GB

**Profiling Tools:**

-   **Unity Profiler** - Performance monitoring

-   **Frame Debugger** - Rendering optimization

-   **Memory Profiler** - Gestión de memoria

## **12. Consideraciones de Seguridad y Compatibilidad**

### **12.1 Gestión de Datos**

**Save System:**

public class SaveSystem : MonoBehaviour

{

private string savePath;

void Awake()

{

savePath = Path.Combine(Application.persistentDataPath,
\"savedata.json\");

}

public void SaveProgress(GameData data)

{

string jsonData = JsonUtility.ToJson(data);

File.WriteAllText(savePath, jsonData);

}

}

**Seguridad:**

-   **No datos sensibles:** El juego no maneja información personal

-   **Saves locales:** Almacenamiento únicamente local

-   **Validación básica:** Checks para prevenir corrupción de archivos

### **12.2 Compatibilidad**

**Resoluciones Soportadas:**

-   1280x720 (HD ready)

-   1920x1080 (Full HD)

-   2560x1440 (2K)

-   3840x2160 (4K) - básico

**Aspectos de Accesibilidad:**

-   **Contraste alto** - Opciones para jugadores con problemas visuales

-   **Subtítulos** - Para todos los elementos de audio

-   **Controles remapeables** - Flexibilidad en input

-   **Colorblind support** - Alternativas a comunicación por color
    > únicamente

## **13. Conclusiones y Próximos Pasos**

### **13.1 Viabilidad Técnica**

El proyecto \"Recuérdame y Recuérdate - Episodio: Despertar\" es
técnicamente viable dentro del timeline y recursos establecidos. Las
decisiones técnicas priorizan:

1.  **Simplicidad sobre Complejidad:** Sistemas core bien implementados
    > vs. features innecesarias

2.  **Escalabilidad:** Arquitectura que permite expansión en futuros
    > episodios

3.  **Performance:** Optimización para hardware medio/bajo para mayor
    > accesibilidad

4.  **Experiencia de Usuario:** Técnicas que sirven a la narrativa, no
    > la complican

### **13.2 Riesgos Técnicos Identificados**

**Alto Impacto, Media Probabilidad:**

-   **Sistema de Deducción:** La lógica del puzzle debe ser intuitiva
    > pero desafiante

-   **Performance de Iluminación:** Los efectos atmosféricos pueden
    > impactar FPS

**Medio Impacto, Alta Probabilidad:**

-   **Timeline de Arte:** Creación de assets 3D puede tomar más tiempo
    > del estimado

-   **Audio Implementation:** Integración de efectos espaciales puede
    > requerir ajustes

### **13.3 Plan de Mitigación**

-   **Prototyping Temprano:** Implementar sistemas core en las primeras
    > 2 semanas

-   **Iteración Constante:** Testing semanal con usuarios objetivo

-   **Assets de Backup:** Identificar alternatives en Asset Store para
    > acelerar desarrollo

-   **Scope Flexibility:** Lista de features \"nice-to-have\" que pueden
    > removerse si es necesario

### **13.4 Métricas de Éxito Técnico**

-   **Performance:** 60 FPS estables en hardware recomendado

-   **Stability:** Cero crashes críticos en build final

-   **User Experience:** Tiempo promedio de resolución 15-20 minutos

-   **Quality:** Calificación promedio 4/5 estrellas en itch.io
