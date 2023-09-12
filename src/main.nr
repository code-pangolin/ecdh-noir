use dep::std::println;

mod ecdsa_secp256k1;
mod ecdsa_secp256r1;
mod biguint;

use ecdsa_secp256k1::fp::PrimeField as Fp;
use ecdsa_secp256k1::fq::PrimeField as Fq;
use ecdsa_secp256k1::{secp256k1,Secp256k1};

use ecdsa_secp256k1::swcurve::Point;

fn main() {
    let Secp256k1 { curve } = secp256k1();

    let p = curve.mul(Fq::from_u56(2), Point::zero());
    assert(p.is_zero());
}

// #[test]
// fn test_main() {
//     main(1, 2);

//     // Uncomment to make test fail
//     // main(1, 1);
// }

fn generate_shared_secret(privkey:Fq ,pubkey:Point) -> Fp {

    let Secp256k1 { curve } = secp256k1();

    let result = curve.mul(privkey,pubkey);

    let x = result.to_affine().0;
    x
}

#[test]
fn test_generate_shared_secret() {
    let privkey = Fq::one();
    let pubkey = Point::from_affine(Fp::one(),Fp::one());

    let secret = generate_shared_secret(privkey,pubkey);
    
    println(secret.to_bytes());
    // Uncomment to make test fail
    // main(1, 1);
}
