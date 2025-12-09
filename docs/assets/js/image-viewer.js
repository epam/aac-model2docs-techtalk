// Image viewer with zoom and pan capabilities
(function() {
  'use strict';
  
  if (window.imageViewerInitialized) return;
  window.imageViewerInitialized = true;
  
  let currentScale = 1;
  let currentX = 0;
  let currentY = 0;
  let isDragging = false;
  let startX, startY;
  
  function createViewer() {
    const overlay = document.createElement('div');
    overlay.id = 'image-viewer-overlay';
    overlay.className = 'image-viewer-overlay';
    
    const container = document.createElement('div');
    container.className = 'image-viewer-container';
    
    const controls = document.createElement('div');
    controls.className = 'image-viewer-controls';
    controls.innerHTML = `
      <button class="iv-btn" id="iv-zoom-out" title="Zoom Out (-)">−</button>
      <button class="iv-btn" id="iv-reset" title="Reset (0)">⟲</button>
      <button class="iv-btn" id="iv-zoom-in" title="Zoom In (+)">+</button>
      <button class="iv-btn iv-btn-close" id="iv-close" title="Close (Esc)">✕</button>
    `;
    
    overlay.appendChild(container);
    overlay.appendChild(controls);
    document.body.appendChild(overlay);
    
    return { overlay, container, controls };
  }
  
  function updateTransform(img) {
    img.style.transform = `translate(${currentX}px, ${currentY}px) scale(${currentScale})`;
  }
  
  function resetTransform() {
    currentScale = 1;
    currentX = 0;
    currentY = 0;
  }
  
  function closeViewer() {
    const overlay = document.getElementById('image-viewer-overlay');
    if (overlay) {
      overlay.classList.remove('active');
      setTimeout(() => {
        overlay.remove();
        document.body.style.overflow = '';
      }, 300);
    }
    resetTransform();
  }
  
  function openViewer(img) {
    const { overlay, container, controls } = createViewer();
    
    const viewerImg = document.createElement('img');
    // Handle URL-encoded src and decode it properly
    viewerImg.src = img.src;
    viewerImg.alt = img.alt || '';
    viewerImg.className = 'image-viewer-img';
    
    // Add error handler in case image fails to load
    viewerImg.onerror = function() {
      console.error('Failed to load image:', viewerImg.src);
      // Try the original img src if decoded version fails
      if (viewerImg.src !== img.getAttribute('src')) {
        viewerImg.src = img.getAttribute('src');
      }
    };
    
    container.appendChild(viewerImg);
    
    // Show overlay
    setTimeout(() => overlay.classList.add('active'), 10);
    document.body.style.overflow = 'hidden';
    
    // Controls
    document.getElementById('iv-zoom-in').onclick = (e) => {
      e.stopPropagation();
      currentScale = Math.min(currentScale + 0.5, 5);
      updateTransform(viewerImg);
    };
    
    document.getElementById('iv-zoom-out').onclick = (e) => {
      e.stopPropagation();
      currentScale = Math.max(currentScale - 0.5, 0.5);
      updateTransform(viewerImg);
    };
    
    document.getElementById('iv-reset').onclick = (e) => {
      e.stopPropagation();
      resetTransform();
      updateTransform(viewerImg);
    };
    
    document.getElementById('iv-close').onclick = (e) => {
      e.stopPropagation();
      closeViewer();
    };
    
    overlay.onclick = (e) => {
      if (e.target === overlay) closeViewer();
    };
    
    // Pan functionality
    viewerImg.onmousedown = (e) => {
      if (currentScale > 1) {
        isDragging = true;
        startX = e.clientX - currentX;
        startY = e.clientY - currentY;
        viewerImg.style.cursor = 'grabbing';
        e.preventDefault();
      }
    };
    
    document.onmousemove = (e) => {
      if (isDragging) {
        currentX = e.clientX - startX;
        currentY = e.clientY - startY;
        updateTransform(viewerImg);
      }
    };
    
    document.onmouseup = () => {
      isDragging = false;
      viewerImg.style.cursor = currentScale > 1 ? 'grab' : 'default';
    };
    
    // Keyboard shortcuts
    const keyHandler = (e) => {
      switch(e.key) {
        case 'Escape':
          closeViewer();
          break;
        case '+':
        case '=':
          currentScale = Math.min(currentScale + 0.5, 5);
          updateTransform(viewerImg);
          break;
        case '-':
        case '_':
          currentScale = Math.max(currentScale - 0.5, 0.5);
          updateTransform(viewerImg);
          break;
        case '0':
          resetTransform();
          updateTransform(viewerImg);
          break;
      }
    };
    
    document.addEventListener('keydown', keyHandler);
    overlay.addEventListener('remove', () => {
      document.removeEventListener('keydown', keyHandler);
    });
    
    // Mouse wheel zoom
    viewerImg.onwheel = (e) => {
      e.preventDefault();
      const delta = e.deltaY > 0 ? -0.2 : 0.2;
      currentScale = Math.max(0.5, Math.min(5, currentScale + delta));
      updateTransform(viewerImg);
    };
  }
  
  function init() {
    const images = document.querySelectorAll('img');
    
    console.log('Image viewer: Found ' + images.length + ' images');
    
    images.forEach(img => {
      if (img.dataset.viewerEnabled) return;
      
      // Wait for image to load before attaching click handler
      const attachHandler = () => {
        // Skip very small images after they've loaded (likely icons)
        if (img.naturalWidth < 100 && img.naturalHeight < 100) return;
        
        img.dataset.viewerEnabled = 'true';
        img.style.cursor = 'zoom-in';
        
        img.addEventListener('click', (e) => {
          e.preventDefault();
          e.stopPropagation();
          console.log('Opening viewer for:', img.src, 'naturalWidth:', img.naturalWidth);
          openViewer(img);
        });
      };
      
      if (img.complete && img.naturalWidth > 0) {
        // Image already loaded
        attachHandler();
      } else {
        // Wait for image to load
        img.addEventListener('load', attachHandler);
        img.addEventListener('error', function() {
          console.error('Image failed to load:', img.src);
        });
      }
    });
  }
  
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
  
  // Re-run init after a delay to catch any dynamically loaded images
  setTimeout(init, 1000);
})();
