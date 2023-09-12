# noir ecdh

## Curve Params

### secp256k1

p=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F
a=0000000000000000000000000000000000000000000000000000000000000000
b=0000000000000000000000000000000000000000000000000000000000000007
Gx=79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
Gy=483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8
n=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141

### secp256r1 (p256)

p=FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
a=FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC
b=5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B
Gx=6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296
Gy=4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5
n=FFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551

## arithmetic

r = p + q

$$

        \begin{gathered}
        \lambda_{1}=\mathbf x_{1}\mathrm z_{2}^{2} \\
        \lambda_2=\operatorname{x}_2\operatorname{z}_1^{\overline{2}} \\
        \lambda_{3}=\lambda_{1}-\lambda_{2} \\
        \lambda_4=\mathbf{y}_1\mathbf{z}_2^3 \\
        \lambda_5=\mathbf{y}_2\mathbf{z}_1^3 \\
        \lambda_{6}=\lambda_{4}-\lambda_{5} \\
        \lambda_{7}=\lambda_{1}+\lambda_{2} \\
        \lambda_8=\lambda_4+\lambda_5 \\
        \mathrm{x}_3=\lambda_6^2-\lambda_7\lambda_3^2 \\
        \lambda_{9}=\lambda_{7}\lambda_{3}^{2}-2\mathrm{x}_{3} \\
        \mathbf{y}_{3}=(\lambda_{9}\lambda_{6}-\lambda_{8}\lambda_{3}^{3})/2 \\
        \mathrm{z}_3=\mathrm{z}_1\mathrm{z}_2\lambda_3
        \end{gathered}
$$

r = p * 2

$$
        \begin{gathered}
        \lambda_1=3\text{x}_1^2+\text{az}_1^4 \\
        \lambda_{2}=4\mathrm{x}_{1}\mathrm{y}_{1}^{2} \\
        \lambda_3=8\mathrm{y}_1^4 \\
        \mathrm{x}_3=\lambda_1^2-2\lambda_2 \\
        \mathbf{y}_{3}=\lambda_{1}(\lambda_{2}-\mathbf{x}_{3})-\lambda_{3} \\
        \mathrm{z}_3=2\mathrm{y}_1\mathrm{z}_1
        \end{gathered}
$$

### ECDH

$$
\begin{gathered}
secret = pk_1 * sk_2 = pk_2 * sk_1 \\

pk_1 = sk_1 * G \\
pk_2 = sk_2 * G \\

\to sk_1 * G * sk_2 = sk_2 * G * sk_1 \\
\to pk_1 * sk_2 = pk_2 * sk_1
\end{gathered}
$$

## Tools

- <https://www.dcode.fr/modulo-n-calculator>
- <https://www.mobilefish.com/services/big_number/big_number.php>
- <https://miniwebtool.com/zh-cn/hex-calculator>
- <https://planetcalc.com/3311/#>

### Calculator

[params calculator using sympy](https://colab.research.google.com/drive/15VYBufqaPGM2HPbdd2D9xlm5zj_9ul-F?usp=sharing)

## ref

- <https://github.com/shuklaayush/noir-bigint>
