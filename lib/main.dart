import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'data.dart';

const kBg = Color(0xFF0B1220);
const kCard = Color(0xFF131C2E);
const kGold = Color(0xFFE6C068);

final ValueNotifier<double> fontScale = ValueNotifier<double>(1.0);

void main() => runApp(const MalaikatApp());

class MalaikatApp extends StatelessWidget {
  const MalaikatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mga Malaikat ni Allah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBg,
        colorScheme:
            ColorScheme.fromSeed(seedColor: kGold, brightness: Brightness.dark),
      ),
      home: const HomePage(),
    );
  }
}

// ---------- Art (picture for each section) ----------

class StarPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white.withOpacity(0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    const step = 48.0;
    int row = 0;
    for (double y = 0; y < size.height + step; y += step) {
      final shift = row.isOdd ? step / 2 : 0.0;
      for (double x = -step; x < size.width + step; x += step) {
        _star(canvas, Offset(x + shift, y), 17, p);
      }
      row++;
    }
  }

  void _star(Canvas c, Offset o, double r, Paint p) {
    for (final rot in [0.0, math.pi / 4]) {
      final path = Path();
      for (int i = 0; i < 4; i++) {
        final a = rot + math.pi / 4 + i * math.pi / 2;
        final pt = Offset(o.dx + r * math.cos(a) * 1.3, o.dy + r * math.sin(a) * 1.3);
        if (i == 0) {
          path.moveTo(pt.dx, pt.dy);
        } else {
          path.lineTo(pt.dx, pt.dy);
        }
      }
      path.close();
      c.drawPath(path, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SectionArt extends StatelessWidget {
  final Section section;
  final double height;
  final double iconSize;
  const SectionArt(
      {super.key,
      required this.section,
      required this.height,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    final d = iconSize * 2.0;
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: section.colors,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: StarPatternPainter()),
          Center(
            child: Container(
              width: d * 1.35,
              height: d * 1.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
              ),
              alignment: Alignment.center,
              child: Container(
                width: d,
                height: d,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.15),
                  border: Border.all(color: Colors.white.withOpacity(0.45), width: 1.5),
                ),
                child: Icon(section.icon, size: iconSize, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Home ----------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 32),
          itemCount: sections.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) return const _Header();
            final s = sections[i - 1];
            return _SectionCard(index: i - 1, section: s);
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 24, 4, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('✦  ISLAM  ✦',
              style: TextStyle(color: kGold, letterSpacing: 4, fontSize: 12)),
          const SizedBox(height: 10),
          const Text('Mga Malaikat\nni Allah',
              style: TextStyle(
                  fontSize: 38,
                  height: 1.1,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          const SizedBox(height: 12),
          Container(width: 56, height: 3, color: kGold),
          const SizedBox(height: 12),
          Text('${sections.length} paksa  •  Pindutin para basahin',
              style: const TextStyle(color: Colors.white54, fontSize: 14)),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final int index;
  final Section section;
  const _SectionCard({required this.index, required this.section});

  @override
  Widget build(BuildContext context) {
    final preview = section.paras.first.replaceAll('• ', '');
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: kCard,
        borderRadius: BorderRadius.circular(22),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => DetailPage(index: index)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'art-$index',
                child: SectionArt(section: section, height: 130, iconSize: 38),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${index + 1}'.padLeft(2, '0'),
                        style: const TextStyle(
                            color: kGold, fontSize: 12, letterSpacing: 2)),
                    const SizedBox(height: 4),
                    Text(section.title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const SizedBox(height: 6),
                    Text(preview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 14, height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Detail ----------

final RegExp _refRe = RegExp(r'\([^)]*\d[^)]*\)');

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  List<InlineSpan> _spans(String t, TextStyle ref) {
    final out = <InlineSpan>[];
    int last = 0;
    for (final m in _refRe.allMatches(t)) {
      if (m.start > last) out.add(TextSpan(text: t.substring(last, m.start)));
      out.add(TextSpan(text: m.group(0), style: ref));
      last = m.end;
    }
    if (last < t.length) out.add(TextSpan(text: t.substring(last)));
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final s = sections[index];
    return Scaffold(
      body: ValueListenableBuilder<double>(
        valueListenable: fontScale,
        builder: (context, scale, _) {
          final base = TextStyle(
              fontSize: 18 * scale, height: 1.75, color: Colors.white.withOpacity(0.9));
          final ref = TextStyle(
              fontSize: 14 * scale, color: kGold, fontWeight: FontWeight.w500);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 260,
                backgroundColor: s.colors.last,
                actions: [
                  TextButton(
                      onPressed: () =>
                          fontScale.value = math.max(0.8, fontScale.value - 0.1),
                      child: const Text('A-',
                          style: TextStyle(color: Colors.white))),
                  TextButton(
                      onPressed: () =>
                          fontScale.value = math.min(1.6, fontScale.value + 0.1),
                      child: const Text('A+',
                          style: TextStyle(color: Colors.white))),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'art-$index',
                    child: SectionArt(section: s, height: 260, iconSize: 56),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PAKSA ${index + 1} / ${sections.length}',
                          style: const TextStyle(
                              color: kGold, letterSpacing: 3, fontSize: 12)),
                      const SizedBox(height: 10),
                      Text(s.title,
                          style: TextStyle(
                              fontSize: 28 * scale,
                              height: 1.2,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(height: 14),
                      Container(width: 56, height: 3, color: kGold),
                      const SizedBox(height: 22),
                      for (final p in s.paras)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: p.startsWith('• ')
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10 * scale, right: 12),
                                      child: const Icon(Icons.circle,
                                          size: 8, color: kGold),
                                    ),
                                    Expanded(
                                      child: Text.rich(TextSpan(
                                          style: base,
                                          children: _spans(
                                              p.substring(2), ref))),
                                    ),
                                  ],
                                )
                              : Text.rich(TextSpan(
                                  style: base, children: _spans(p, ref))),
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (index > 0)
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) =>
                                            DetailPage(index: index - 1))),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('Nauna'),
                              ),
                            ),
                          if (index > 0 && index < sections.length - 1)
                            const SizedBox(width: 12),
                          if (index < sections.length - 1)
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) =>
                                            DetailPage(index: index + 1))),
                                icon: const Icon(Icons.arrow_forward),
                                label: const Text('Susunod'),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
