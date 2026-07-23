---
layout: default
title: Computer Vision
parent: AI & Machine Learning
---

# Computer Vision
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

## Introduction

Computer Vision (CV) enables computers to interpret visual information from images and videos. It encompasses image classification, object detection, segmentation, and image generation. CV has achieved remarkable progress through deep learning, particularly CNNs.

Applications include autonomous vehicles, medical imaging, facial recognition, augmented reality, surveillance, and robotics.

---

## Key Concepts

### Convolution Operation
Output size = (Input size - Kernel size + 2 × Padding) / Stride + 1

Filters learn to detect edges, textures, and patterns. Parameter sharing reduces parameters dramatically.

### CNN Architecture Evolution
| Architecture | Year | Key Innovation |
|-------------|------|----------------|
| LeNet-5 | 1998 | Convolution for digits |
| AlexNet | 2012 | ReLU, Dropout, GPU training |
| VGG | 2014 | Uniform 3×3 convolutions |
| ResNet | 2015 | Skip connections (152+ layers) |
| EfficientNet | 2019 | Compound scaling |
| ConvNeXt | 2022 | Modernized ConvNet |

### Object Detection
- **Two-stage**: Faster R-CNN (region proposals + classification) — more accurate
- **Single-stage**: YOLO, SSD — faster, real-time
- **Key metrics**: IoU (Intersection over Union), mAP, NMS (Non-Maximum Suppression)

### Image Segmentation
- **Semantic**: Classify each pixel (no instance distinction)
- **Instance**: Separate individual object instances
- **Panoptic**: Combines semantic and instance
- **U-Net**: Encoder-decoder with skip connections (medical imaging)

### Data Augmentation
- **Geometric**: Flip, rotate, scale, crop
- **Color**: Brightness, contrast, saturation jittering
- **Advanced**: Cutout, Mixup, CutMix, Mosaic (YOLO)

---

## FAQ

### Q1: Why are CNNs better than fully connected networks for images?
CNNs exploit spatial structure through parameter sharing (same filter across positions) and local connectivity, dramatically reducing parameters.

### Q2: What is the receptive field?
Region of input affecting a particular output neuron. Grows with network depth. Understanding it helps design architectures for specific object sizes.

### Q3: What is transfer learning in CV?
Using pre-trained models (e.g., ImageNet) as starting points. Replace final layer and fine-tune on your dataset. Saves time, requires less data.

### Q4: How does YOLO achieve real-time detection?
Processes entire image in one pass, dividing into grid and predicting bounding boxes and class probabilities simultaneously.

### Q5: What is Non-Maximum Suppression?
Removes overlapping detections. Sorts boxes by confidence, suppresses boxes with high IoU (>0.5) with top-scoring box.

### Q6: What is the difference between ResNet and VGG?
VGG uses simple sequential architecture. ResNet adds skip connections enabling 152+ layer training by solving vanishing gradients.

### Q7: How do you deploy CV models on mobile?
Model compression (pruning, quantization, distillation), efficient architectures (MobileNet), ONNX/TensorRT conversion.

### Q8: What is Vision Transformer (ViT)?
Applies transformer to images by splitting into patches treated as tokens. Competitive with CNNs on large datasets.

### Q9: What is mAP?
Mean Average Precision across all classes. mAP@0.5 uses IoU threshold 0.5; mAP@0.5:0.95 averages over thresholds.

### Q10: What is depthwise separable convolution?
Splits standard convolution into depthwise (per-channel) and pointwise (1×1) operations. Dramatically reduces parameters. Core of MobileNet.

---

## Common Mistakes

1. Not normalizing images to match pre-trained model expectations
2. Ignoring data augmentation — leads to overfitting
3. Using wrong input size for pre-trained models
4. Not freezing layers during initial fine-tuning
5. Ignoring class imbalance in detection/segmentation
6. Deploying models without inference speed optimization
7. Not considering computational budget for real-time applications
8. Ignoring domain shift between training and deployment data

---

## Best Practices

1. Start with transfer learning (pre-trained ImageNet models)
2. Use appropriate data augmentation for your domain
3. Monitor both classification and localization metrics
4. Use learning rate scheduling for fine-tuning
5. Start with smaller models, scale up as needed
6. Validate on diverse test sets
7. Use mixed precision training for speed
8. Always visualize predictions for qualitative evaluation

---

## Quick Reference

| Task | Model | Key Metric |
|------|-------|------------|
| Classification | ResNet, EfficientNet | Accuracy, F1 |
| Detection | YOLO, Faster R-CNN | mAP@0.5, mAP@0.5:0.95 |
| Segmentation | U-Net, Mask R-CNN | IoU, Dice Score |
| Face Recognition | ArcFace | Verification accuracy |
| Generation | GANs, Diffusion | FID, IS |

### Key Formulas
- **Conv output**: (H - K + 2P) / S + 1
- **IoU**: |A ∩ B| / |A ∪ B|
- **Dice Score**: 2|A ∩ B| / (|A| + |B|)
- **Params (Conv)**: K × K × C_in × C_out + C_out

---

## Resources

- "Computer Vision: Algorithms and Applications" (Szeliski)
- Stanford CS231n, MIT 6.S191
- PyTorch, OpenCV, Detectron2, MMDetection
- ImageNet, COCO, Pascal VOC datasets
