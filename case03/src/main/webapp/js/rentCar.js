function showBookingModal(carId) {
    // Lấy thẻ modal và các phần tử liên quan
    var modal = document.getElementById("bookingModal");
    var closeModalBtn = document.getElementById("closeModalBtn");

    // Thiết lập giá trị cho các phần tử trong modal
    var carIdInput = document.getElementById("carIdInput");
    carIdInput.value = carId;

    // Hiển thị modal
    modal.style.display = "block";

    // Bắt sự kiện click vào nút đóng modal
    closeModalBtn.onclick = function () {
        modal.style.display = "none";
    }
}
