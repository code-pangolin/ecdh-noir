fn iterhash(data: [u8;32], n:u64) -> [u8;32] {

    // dep::std::println(data);

    let mut res:[u8] = data;

    for _ in 0..n{
        res = dep::std::hash::sha256(res);
    }

    let mut array = [0;32];

    for i in 0..32{
        array[i] = res[i];
    }

    array
}
