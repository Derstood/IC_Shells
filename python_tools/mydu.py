# ANSI颜色转义码
class Color:
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    DARKCYAN = '\033[36m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BLACK = '\033[30m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    END = '\033[0m'

# 获取文件类型（文件、目录、链接）
def get_file_type_color(path):
    if os.path.islink(path):
        return Color.PURPLE
    elif os.path.isfile(path):
        return Color.BLACK
    elif os.path.isdir(path):
        return Color.GREEN
    else:
        return Color.RED

def get_directory_size(path):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(path):
        for filename in filenames：
            filepath = os.path..join(dirpath, filename)
            total_size += get_file_size(filepath)


def get_file_size(path):
    if os.path.islink(path):
        return 4096
    if os.path.isdir(path):
        return get_directory_size(path)
    return os.path.getsize(path)


# 获取当前目录下所有文件和子目录的大小和类型
sizes = [(f, os.path.getsize(f), get_file_type_color(f)) for f in os.listdir()]
# 按大小排序
sizes.sort(key=lambda x: x[1])

# 获取最长文件名长度，用于对齐
max_name_length = max(len(name) for name, _, _ in sizes)

# 输出结果
for name, size, color in sizes:
    file_type = get_file_type(name)
    print(f"{color}{name.ljust(max_name_length)}: {convert_size(size)} ({file_type}){Color.END}")
