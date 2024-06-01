from PIL import Image, ImageDraw

class DamVisualizer:
    def __init__(self, dam_height, dam_width, water_level):
        self.dam_height = dam_height
        self.dam_width = dam_width
        self.water_level = water_level

    def draw_dam(self):
        # Crea una nueva imagen con fondo blanco
        image = Image.new("RGB", (400, 300), "white")
        draw = ImageDraw.Draw(image)

        # Dibuja la presa
        dam_coords = [(50, 200), (350, 200), (350, 200 - self.dam_height), (50, 200 - self.dam_height)]
        draw.polygon(dam_coords, outline="black", fill="gray")

        # Dibuja el agua
        water_coords = [(50, 200), (350, 200), (350, 200 - self.water_level), (50, 200 - self.water_level)]
        draw.polygon(water_coords, fill="blue")

        # Dibuja las etiquetas
        draw.text((200, 220), "Presa", fill="black")
        draw.text((200, 100), "Agua", fill="black")

        return image

def main():
    dam_height = 100
    dam_width = 300
    water_level = 60
    visualizer = DamVisualizer(dam_height, dam_width, water_level)
    
    # Genera y guarda la imagen
    image = visualizer.draw_dam()
    image.save("dique.png")

if __name__ == "__main__":
    main()
