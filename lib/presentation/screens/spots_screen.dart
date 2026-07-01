import 'package:flutter/material.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';
import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:fishing_hobby_app/core/theme/app_theme.dart';

class SpotsScreen extends StatefulWidget {
  final FishingRepository repository;

  const SpotsScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<SpotsScreen> createState() => _SpotsScreenState();
}

class _SpotsScreenState extends State<SpotsScreen> {
  List<FishingSpot> _spots = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSpots();
  }

  Future<void> _loadSpots() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final spots = await widget.repository.getAllSpots();
      setState(() {
        _spots = spots;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _showSpotDetails(FishingSpot spot) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(spot.name, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(spot.description, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.waves, 'Kedalaman', spot.depthRange),
              _buildInfoRow(Icons.calendar_today, 'Musim Terbaik', spot.bestSeason),
              _buildInfoRow(Icons.speed, 'Tingkat Kesulitan', spot.difficulty),
              const Divider(height: 24),
              Text('Zona Karang (${spot.coralZones.length})', style: Theme.of(context).textTheme.titleLarge),
              ...spot.coralZones.map((c) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.waves, color: AppTheme.coralColor, size: 20),
                    const SizedBox(width: 8),
                    Text('${c.type} • ${c.depth}m'),
                  ],
                ),
              )),
              const Divider(height: 24),
              Text('Spot Ikan (${spot.fishSpots.length})', style: Theme.of(context).textTheme.titleLarge),
              ...spot.fishSpots.map((f) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.set_meal, color: AppTheme.fishZoneColor, size: 20),
                        const SizedBox(width: 8),
                        Text(f.fishTypes.join(', '), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text('Waktu terbaik: ${f.bestTime}', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              )),
              if (spot.amenities.isNotEmpty) ...[
                const Divider(height: 24),
                Text('Fasilitas', style: Theme.of(context).textTheme.titleLarge),
                Wrap(
                  spacing: 8,
                  children: spot.amenities.map((a) => Chip(label: Text(a))).toList(),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryColor),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text('Gagal memuat spot: $_error'));
    }
    return RefreshIndicator(
      onRefresh: _loadSpots,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _spots.length,
        itemBuilder: (context, index) {
          final spot = _spots[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppTheme.accentColor,
                child: Icon(Icons.location_on, color: Colors.white),
              ),
              title: Text(spot.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(spot.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: Chip(
                label: Text(spot.difficulty),
                backgroundColor: spot.difficulty == 'mudah'
                    ? AppTheme.successColor.withValues(alpha: 0.2)
                    : spot.difficulty == 'sedang'
                        ? AppTheme.warningColor.withValues(alpha: 0.2)
                        : AppTheme.errorColor.withValues(alpha: 0.2),
              ),
              onTap: () => _showSpotDetails(spot),
            ),
          );
        },
      ),
    );
  }
}
