import random
import pandas as pd

# ===== إعدادات =====
TOTAL_NAMES = 2000
LENGTHS = [4,5,6]

# أحرف إنجليزية
english = list("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
english2 = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
english3 = list("abcdefghijklmnopqrstuvwxyz")
# أحرف لاتينية موسعة
latin_ext = list(
    "àáâãäåæçèéêëìíîïñòóôõöøùúûüýÿœšžĀāČčĎďĒēĖėĘęĚěĢģĪīĶķĻļŅņŌōŔŕŚśŠšŪūŽž"
)

# أحرف يونانية
greek = list(
    "ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ"
    "αβγδεζηθικλμνξοπρστυφχψω"
)

# رموز ومحارف زخرفية

symbols = [
    "⏆", "⌱", "⏚", "⌰", "⍤", "⌬", "⍣", "⌔", "⌕", "⍬",
    "⌕", "⌀", "⌁", "⌭", "⍝", "⫘", "⨱", "⩕", "⩙", "⩖",
    "⨰", "⨔", "⨰", "⨱", "⋰", "⋱", "⊶", "⊷", "⋄", "⋆",
    "⋇", "⥈", "⥉", "⥉", "⥾", "⥿", "⥺", "⥉", "⥈", "⅊",
    "⤙", "⤚", "‡", "‽", "⁂", "⁜"
]


# دمج جميع المحارف
charset = english 
# + symbols
# + latin_ext + greek 


def generate_name():
    length = random.choice(LENGTHS)

    # ضمان وجود حرف واحد على الأقل (وليس رموز فقط)
    first = random.choice(english2)
    second = random.choice(english)
    rest = [random.choice(charset) for _ in range(length - 1)]

    chars = [first] + rest
    random.shuffle(chars)
    return "".join(chars)


# توليد أسماء فريدة
names = set()
while len(names) < TOTAL_NAMES:
    names.add(generate_name())

# ترتيب النتائج
sorted_names = sorted(names, key=lambda x: (len(x), x.casefold()))

# إنشاء جدول
df = pd.DataFrame({
    "#": range(8, len(sorted_names) + 8),
    "Username": sorted_names,
    "Length": [len(name) for name in sorted_names]
})

# حفظ إلى Excel
output_file = "unique3.xlsx"
df.to_excel(output_file, index=False)

print(f"Done! Generated {len(sorted_names)} usernames.")
print(f"Saved to: {output_file}")

# عرض أول 20 اسم
print(df.head(20))