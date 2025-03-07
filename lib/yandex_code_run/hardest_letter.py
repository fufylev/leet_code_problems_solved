import sys

def get_hardest_letter(n: int, string: str, timeline: list[int]) -> str:
    if n == 0 or not timeline:
        return ''

    hardest_letter = string[0]
    hardest_time = timeline[0]
    prev_time = timeline[0]

    for i in range(1, n):
        next_time = timeline[i] - prev_time
        if next_time >= hardest_time:
            hardest_time = next_time
            hardest_letter = string[i]
        prev_time = timeline[i]

    return hardest_letter

def main():
    n = int(input())
    string = input()
    timeline = list(map(int, input().split()))

    result = get_hardest_letter(n, string, timeline)
    print(result)


if __name__ == '__main__':
    main()