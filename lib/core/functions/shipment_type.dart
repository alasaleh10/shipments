String shipmentType(int status) {
  if (status == 0) {
    return 'لم تتحرك بعد';
  } else if (status == 1) {
    return 'في الطريق';
  } else {
    return 'تم توصيلها';
  }
}
