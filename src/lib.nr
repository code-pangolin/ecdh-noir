use dep::std::println;

mod hash;
mod secret_key;
mod public_key;
mod signature;

use hash::iterhash;

fn main() {
    let mut sk:[[u8;32];32] = [[0;32];32];
    let mut pk:[[u8;32];32] = [[0;32];32];

    for i in 0..32{
        sk[i] = [i;32];
        pk[i] = iterhash(sk[i],256);
    }

    let raw = "The quick brown fox jumps over the lazy dog";
    let msg = dep::std::hash::sha256(raw.as_bytes());

    let mut sig:[[u8;32];32] = [[0;32];32];

    // generate signature
    for i in 0..32{
        let n = msg[i];
        sig[i] = iterhash(sk[i],n as u64);
    }

    // verify signature
    for i in 0..32{
        let n = msg[i];
        // println(iterhash(sig[i], 256 - (n as u64)));
        // println(pk[i]);
        assert(iterhash(sig[i], 256 - (n as u64)) == pk[i]);
    }

    // main(1, 2);

    // Uncomment to make test fail
    // main(1, 1);
}

#[test]
fn test_main() {
    main()
}
