import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PropertyDetailShimmer extends StatelessWidget {
  const PropertyDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Banner Image
                Stack(
                  children: [
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),

                    Positioned(
                      top: 16,
                      left: 16,
                      child: _circle(52),
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: _circle(52),
                    ),

                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        height: 55,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// Title + Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _line(double.infinity, 18),
                          const SizedBox(height: 14),

                          Row(
                            children: [
                              _circle(14),
                              const SizedBox(width: 8),
                              Expanded(child: _line(120, 10)),
                              const SizedBox(width: 12),
                              Expanded(child: _line(110, 10)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                /// Amenities
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: List.generate(
                      5,
                          (index) => Column(
                        children: [
                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 10),
                          _line(55, 8),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Price Card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          _line(80, 18),
                          const SizedBox(width: 10),
                          _line(70, 14),
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(14),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Row(
                        children: [
                          _line(140, 10),
                          const Spacer(),
                          _circle(20),
                          const SizedBox(width: 8),
                          _line(120, 10),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: List.generate(
                            3,
                                (index) => Expanded(
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    _circle(24),
                                    const SizedBox(height: 14),
                                    _line(80, 10),
                                    const SizedBox(height: 8),
                                    _line(100, 10),
                                    const SizedBox(height: 8),
                                    _line(70, 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                /// Tabs
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                          (index) => _line(90, 10),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// Review Card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                _line(double.infinity, 12),
                                const SizedBox(height: 12),
                                _line(150, 10),
                                const SizedBox(height: 12),

                                Row(
                                  children: List.generate(
                                    4,
                                        (index) => Padding(
                                      padding:
                                      const EdgeInsets.only(
                                        right: 18,
                                      ),
                                      child: _line(40, 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 18),

                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Description
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      _line(180, 14),
                      const SizedBox(height: 20),
                      _line(50, 12),
                      const SizedBox(height: 12),
                      _line(220, 12),
                      const SizedBox(height: 12),
                      _line(double.infinity, 12),
                      const SizedBox(height: 12),
                      _line(280, 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _line(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}