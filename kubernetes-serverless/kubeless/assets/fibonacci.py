def fibonacci(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    return fibonacci(n-1) + fibonacci(n-2)

def sequence(length):
  row = [fibonacci(n) for n in range(1,length)]
  result = ','.join( str(x) for x in row )
  print("Fibonacci sequence: " + result)
  return {"sequence":result}

def values(event, context):
  length = event['data']['length']
  return sequence(int(length))
