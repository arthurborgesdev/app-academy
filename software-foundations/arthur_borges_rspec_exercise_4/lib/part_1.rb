def my_reject(arr, &prc)
  arr.select { |elem| prc.call(elem) == false }
end

def my_one?(arr, &prc)
  count = 0
  arr.each { |elem| count += 1 if prc.call(elem) == true }
  count == 1 ? true : false
end

def hash_select(hash, &prc)
  final_hash = {}
  hash.each { |k, v| final_hash[k] = v if prc.call(k, v) }
  final_hash
end

def xor_select(arr, prc1, prc2)
  arr.select { |elem| prc1.call(elem) ^ prc2.call(elem) }
end

def proc_count(val, arr)
  count = 0
  arr.each { |prc| count += 1 if prc.call(val) }
  count
end