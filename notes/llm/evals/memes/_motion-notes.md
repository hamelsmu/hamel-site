/*this is how you would write a carousel with motion.plus and motion.react adapt it as you need*/
"use client"

import { Carousel, useCarousel } from "motion-plus/react"
import { motion } from "motion/react"

function Navigation() {
    const { nextPage, prevPage, isNextActive, isPrevActive } = useCarousel()

    return (
        <nav className="navigation">
            <motion.button
                className="nav-arrow"
                aria-label="Previous page"
                onClick={prevPage}
                animate={{ opacity: isPrevActive ? 1 : 0.3 }}
                transition={{ duration: 0.3 }}
            >
                <ChevronLeftIcon />
            </motion.button>

            <motion.button
                className="nav-arrow"
                aria-label="Next page"
                onClick={nextPage}
                animate={{ opacity: isNextActive ? 1 : 0.3 }}
                transition={{ duration: 0.3 }}
            >
                <ChevronRightIcon />
            </motion.button>
        </nav>
    )
}

export default function CarouselPaginationArrowsExample() {
    const images = [
        { src: "1", aspectRatio: 4 / 3 },
        { src: "2", aspectRatio: 4 / 3 },
        { src: "3", aspectRatio: 3 / 4 },
        { src: "4", aspectRatio: 4 / 3 },
        { src: "5", aspectRatio: 4 / 3 },
        { src: "6", aspectRatio: 2 / 3 },
    ]

    return (
        <article>
            <div className="carousel-container">
                <Carousel
                    className="carousel"
                    items={images.map((image, index) => (
                        <img
                            key={index}
                            draggable={false}
                            className="photo"
                            src={`/photos/amsterdam-cyclists/${image.src}.jpg`}
                            alt={`Photo ${index + 1}`}
                            style={{ aspectRatio: image.aspectRatio }}
                        />
                    ))}
                    overflow
                    gap={20}
                    snap="page"
                    loop={false}
                >
                    <Navigation />
                </Carousel>
            </div>
            <Stylesheet />
        </article>
    )
}

/**
 * ==============   Styles   ================
 */
function Stylesheet() {
    return (
        <style>
            {`
        body {
            overflow: hidden;
        }

        #sandbox {
          align-items: center;
        }

        article {
          width: 100%;
          max-width: 600px;
          display: flex;
          flex-direction: column;
          gap: 20px;
          padding: 20px;
        }

        .carousel-container {
          position: relative;
          padding: 20px;
          box-sizing: border-box;
        }

        .carousel {
          position: relative;
        }

        .photo {
          height: 300px;
          max-width: 100%;
          border-radius: 12px;
          object-fit: cover;
        }

        @media (max-width: 600px) {
          .photo {
            height: 150px;
          }
        }

        .navigation {
          position: absolute;
          left: 0;
          right: 0;
          display: flex;
          align-items: center;
          gap: 16px;
          padding: 12px 16px;
          border-radius: 24px;
          z-index: 30;
        }

        .nav-arrow {
          background: none;
          border: none;
          color: white;
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 4px;
          transition: opacity 0.2s ease;
          border-radius: 50%;
        }

        .nav-arrow:focus-visible {
          outline: 2px solid white;
        }

        .nav-arrow:disabled {
          opacity: 0.3;
          cursor: not-allowed;
        }

        .nav-arrow:not(:disabled):hover {
          opacity: 0.8;
        }

        .dots {
          display: flex;
          gap: 8px;
        }

        .dot {
          width: 8px;
          height: 8px;
          border-radius: 50%;
          background: rgba(255, 255, 255, 0.4);
          border: none;
          cursor: pointer;
          padding: 0;
          transition: background-color 0.2s ease;
          will-change: transform;
        }

        .dot.active {
          background: white;
        }

        .dot:hover {
          background: rgba(255, 255, 255, 0.6);
        }
      `}
        </style>
    )
}

function ChevronLeftIcon() {
    return (
        <svg
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <path d="M15 18l-6-6 6-6" />
        </svg>
    )
}

function ChevronRightIcon() {
    return (
        <svg
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <path d="M9 18l6-6-6-6" />
        </svg>
    )
}
