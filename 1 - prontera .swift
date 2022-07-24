// -- perbedaan let var
    // let = deklarasi variabel konstan (immutable), var = deklarasi variable (mutable)


// -- Buat program dengan menampilkan pola berikut berdasarkan nilai n (n<=10)! Misalkan n=4, maka hasilnya:
let n = 4

for i in 1...n {
    print("\(i)\(i)\(i)\(i)")
}

// -- Tampilkan bilangan berikut: 1, 8, 27, 64, 125, ... hingga n pangkat 3, dengan n adalah angka (n <= 100)! 
let m = 5
for i in 1...n {
    print("\(i*i*i)")
}


// -- Buatlah Struct Student yang berisi nama panggilan, nama lengkap, dan ipk
struct Student {
    var nickname: String
    var fullname: String
    var ipk: Float
}

let students = [
    Student(nickname: "Asep", fullname: "Asep Supratman", ipk: 3.5),
    Student(nickname: "Bambang", fullname: "Bambang Ambarita", ipk: 2.7),
    Student(nickname: "Cahyo", fullname: "Cahyo Untoro", ipk: 1.7),
    Student(nickname: "Djarot", fullname: "Djarot Muhammad", ipk: 4.0),
    Student(nickname: "Eko", fullname: "Eko Hasibulan", ipk: 3.7),
]

// -- buatlah program dengan isi struct diatas dengan data berjumlah 5 lalu cari siapa nilai ipk tertinggi dan ipk terendah --
let higest = students.max { $0.ipk < $1.ipk }
print(higest!.nickname)

let lowest = students.min { $01.ipk > $0.ipk }
print(lowest!.nickname)

// -- Buatlah Class Animal yang berisi fungsi suara --
class Animal {
    func sound(){
        print("ANIMAL SOUND")
    }
}
