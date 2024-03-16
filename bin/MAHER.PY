import docx
path = 'C:\\Users\\asus\\Desktop\\Quran.docx' #your docx file path
doc = docx.Document(path)
font = None
fonts = []
for p in doc.paragraphs:
    texts = []
    sizes = []
    print(len(p.runs))
    for i in range(len(p.runs)):
        
        if p.runs[i] == ' ':
            continue
        if font != p.runs[i].font.name:
            font = p.runs[i].font.name
            fonts.append(p.runs[i - 1].text)


print(fonts)