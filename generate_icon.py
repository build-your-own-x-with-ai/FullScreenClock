from PIL import Image, ImageDraw
import math

# Create a 512x512 image with transparency
size = 512
img = Image.new('RGBA', (size, size), (255, 255, 255, 0))
draw = ImageDraw.Draw(img)

center_x, center_y = size // 2, size // 2

# Draw background circle (blue)
margin = 20
radius = (size - margin * 2) // 2
draw.ellipse(
    [margin, margin, size - margin, size - margin],
    fill=(33, 150, 243, 255),
    outline=(25, 118, 210, 255),
    width=8
)

# Draw clock face (white)
face_margin = 60
face_radius = (size - face_margin * 2) // 2
draw.ellipse(
    [face_margin, face_margin, size - face_margin, size - face_margin],
    fill=(255, 255, 255, 255),
    outline=(25, 118, 210, 255),
    width=4
)

# Draw hour markers (12, 3, 6, 9)
marker_length = 20
marker_width = 8
positions = [
    (center_x, face_margin, center_x, face_margin + marker_length),  # 12
    (size - face_margin, center_y, size - face_margin - marker_length, center_y),  # 3
    (center_x, size - face_margin, center_x, size - face_margin - marker_length),  # 6
    (face_margin, center_y, face_margin + marker_length, center_y),  # 9
]
for pos in positions:
    draw.line(pos, fill=(51, 51, 51, 255), width=marker_width)

# Draw smaller markers at 45 degrees
small_marker_length = 15
small_marker_width = 6
angle_offset = math.pi / 4
for i in range(4):
    angle = angle_offset + i * math.pi / 2
    x1 = center_x + (face_radius - 10) * math.cos(angle)
    y1 = center_y + (face_radius - 10) * math.sin(angle)
    x2 = center_x + (face_radius - 10 - small_marker_length) * math.cos(angle)
    y2 = center_y + (face_radius - 10 - small_marker_length) * math.sin(angle)
    draw.line([x1, y1, x2, y2], fill=(102, 102, 102, 255), width=small_marker_width)

# Draw hour hand (pointing to 10:00)
hour_angle = math.pi * (10 / 6 - 0.5)  # 10 o'clock
hour_length = face_radius * 0.5
hour_x = center_x + hour_length * math.cos(hour_angle)
hour_y = center_y + hour_length * math.sin(hour_angle)
draw.line([center_x, center_y, hour_x, hour_y], fill=(51, 51, 51, 255), width=12)

# Draw minute hand (pointing to 10 minutes / 2 o'clock position)
minute_angle = math.pi * (2 / 6 - 0.5)  # 2 o'clock
minute_length = face_radius * 0.7
minute_x = center_x + minute_length * math.cos(minute_angle)
minute_y = center_y + minute_length * math.sin(minute_angle)
draw.line([center_x, center_y, minute_x, minute_y], fill=(102, 102, 102, 255), width=8)

# Draw second hand (pointing to 6 o'clock / 30 seconds)
second_angle = math.pi / 2  # 6 o'clock
second_length = face_radius * 0.8
second_x = center_x + second_length * math.cos(second_angle)
second_y = center_y + second_length * math.sin(second_angle)
draw.line([center_x, center_y, second_x, second_y], fill=(244, 67, 54, 255), width=4)

# Draw center dot
center_radius = 12
draw.ellipse(
    [center_x - center_radius, center_y - center_radius,
     center_x + center_radius, center_y + center_radius],
    fill=(244, 67, 54, 255),
    outline=(255, 255, 255, 255),
    width=2
)

# Save the icon
img.save('assets/icon.png', 'PNG')
print('Icon generated successfully: assets/icon.png')
